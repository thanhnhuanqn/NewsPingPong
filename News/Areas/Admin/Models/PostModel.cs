using News.Areas.Admin.Models;
using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace News.Areas.Admin.Models
{
    public class PostModel : DBContext
    {
        internal static NewsEntities db = new NewsEntities();

        public static int _iConvert(string id)
        {
            return Convert.ToInt32(id);
        }

        /// <summary>
        /// PUBLIC 
        /// </summary>
        public static Posts Get(decimal id)
        {
            using (var context = newContext)
            {
                return context.Posts.Find(id);
            }

        }

        public static dynamic CountType(string postStatus, string postType)
        {
            using (var context = newContext)
            {
                dynamic count = context.proc_PostType(postStatus, postType).FirstOrDefault();

                if (count != null)
                {
                    return Convert.ToInt32(count);
                }
                return 0;

            }
        }

        public static Posts Get(string post_name)
        {

            var post = db.Posts.Where(p => p.Name == post_name).FirstOrDefault();

            if (post != null) return post;

            return null;

        }

        /// <summary>
        /// Lấy tất cả các Post
        /// </summary>
        /// <param name="orderby">Thứ tự sắp xếp</param>
        /// <param name="type">Loại post cần lấy: post, page, attactment, ...</param>
        /// <param name="search">Lọc theo post_title hay không ?</param>
        /// <returns>Tất cả các Post thoả điều kiện.</returns>

        public static IEnumerable<Posts> GetAll(string orderby, string type = null, string search = null)
        {
            dynamic posts = null;

            if (type != null)
            {
                posts = db.Posts.Where(p => p.Type == type).OrderByDescending(p => p.PostID);
            }

            if (search != null)
            {
                search = Regex.Replace(search, "'", "");
                if (type == null)
                {
                    posts = db.Posts.Where(p => p.Title == search).OrderByDescending(p=>p.PostID);
                }
                else
                {
                    posts = db.Posts.Where(p => p.Type == type && p.Title == search).OrderByDescending(p => p.PostID);
                }
            }
            return posts;
        }


        public static IEnumerable<Posts> GetAll(string type)
        {

            return db.Posts.Where(p => p.Type == type).OrderByDescending(p=>p.PostID);
        }

        public static bool CheckPostNameExists(int id, string post_name)
        {
            return CountPostNames(post_name, id) >= 1 ? true : false;
        }
        /// <summary>
        /// Tìm kiếm tất cả các post_name nào giống với post_name đưa vào không ?
        /// </summary>
        /// <param name="post_name">post_name cần tìm</param>
        /// <param name="id">Không tìm chính nó.</param>
        /// <returns>Danh sách các post_name trùng.</returns>
        public static int CountPostNames(string post_name, int id = -1)
        {

            var post = db.Posts.Where(p => p.Name == post_name);

            if (id > 0)
            {
                post = db.Posts.Where(p => p.PostID != id && p.Name == post_name);
                return post.Count();
            }

            return post.Count();


        }

        /// <summary>
        /// Xoá bỏ một loại Post bằng cách chỉ định Id hoặc post_name của nó.
        /// </summary>
        /// <param name="idPostOrPostName">ID của Post hoặc post_name của Post</param>
        public static void Remove(dynamic idPostOrPostName)
        {
            using (var context = newContext)
            {
                Posts result = Get(idPostOrPostName);

                if (result != null)
                {
                    //Xoá mối liên hệ giữa post với các danh mục
                    DeleteCategories(idPostOrPostName);
                    //Xoá mối liên hệ giữ post với các tag
                    DeleteTag(result.Name);
                                        
                    db.Posts.Remove(result);
                    db.SaveChanges();

                    PostMetaModel.DeleteMetaKey(result.PostID, "_thumbnail_id");

                }
            }
        }
        /// <summary>
        /// Them cac tag cho mot bai viet
        /// </summary>
        /// <param name="tags">cac tag ma bai viet thuoc ve</param>
        /// <param name="post_name">post_title cua bai viet, dung post_name de lay postid</param>
        public static void AddLinkTags(string tags, string post_name, string taxonomy = "tag")
        {
            IEnumerable<string> listTags;

            if (!string.IsNullOrEmpty(tags))
            {

                listTags = tags.Split(',').Where(t => t != string.Empty).Select(t => t = t.Trim()).Distinct();

                var post = Get(post_name);

                TagModel.AddList(post.PostID, listTags, taxonomy);

            }
        }

        /// <summary>
        /// Xoa cac bai viet co id chua trong listItem
        /// </summary>
        /// <param name="listIdPost">chuoi chua cac Id cua bai viet can xoa</param>
        public static void DeleteList(string listIdPost)
        {
            if (!string.IsNullOrEmpty(listIdPost))
            {

                string[] arraySlug = listIdPost.Split(',').Where(p => p != string.Empty).ToArray();

                if (arraySlug.Count() > 0)
                {
                    foreach (var idPost in arraySlug)
                    {
                        //Remove(Convert.ToInt32(idPost));
                        Delete(Convert.ToInt32(idPost));
                    }
                }
            }
        }


        public static void DeleteList(dynamic listItem)
        {
            if (listItem != null)
            {
                foreach (var idPost in listItem)
                {
                    Remove(idPost);
                }
            }
        }

        /// <summary>
        /// Lấy Id của môt Post NGAY SAU KHI Insert một record mới vào table posts
        /// </summary>
        /// <returns>Id của Post</returns>
        public static int GetLastId()
        {

            var post = db.Posts.OrderByDescending(p => p.PostID).FirstOrDefault();

            return int.Parse(post.PostID.ToString());

        }

        /// <summary>
        /// Thêm một thông tin: có một bài viết mới thuộc về một danh mục nào đó
        /// Sau khi thêm thông tin về mối liên hệ này vào term_relationship thì
        /// cập nhật số lượng bài viết thuộc danh mục đó thêm 1.
        /// </summary>
        /// <param name="categories">Danh sách các danh mục có liên quan đến bài viết</param>
        /// <param name="id">Id trong trường hợp cập nhật</param>
        public void AddCategories(string categories, string name)
        {
            if (!string.IsNullOrEmpty(categories))
            {

                var listCategories = categories.Split(',').Where(t => t != string.Empty).ToArray();

                using (var context = newContext)
                {
                    var post = context.Posts.FirstOrDefault(t => t.Name == name);

                    foreach (var category in listCategories)
                    {
                        Category cat = context.Category.Find(int.Parse(category));
                        if (cat != null)
                        {
                            post.Category.Add(cat);
                            context.SaveChanges();
                            CountPost(post.PostID);
                        }
                    }
                }

            }
        }


        /// <summary>    
        /// Post ~ Node of Drupal or Post of Wordpress (~.~)
        /// 
        /// "Hãy cho tôi một chuổi post_name hoặc ID của một Post bất kỳ.
        /// Việc xoá các danh mục mà post này thuộc về là việc của tôi"
        /// </summary>
        /// <param name="slug">slug or Id của post</param>

        public static void DeleteCategories(dynamic IdOrPostName, string taxonomy = "category")
        {

            var sql = string.Empty;
            Posts idPost = Get(IdOrPostName);

            if (idPost != null)
            {
                //count post:truoc khi xoa moi lien quan giua danh muc va post trong term_relationships. 
                //tru bot so luong post trong mot danh muc goc
                var idCats = GetCategories(idPost.Name, taxonomy);
                if (idCats != null)
                {
                    RemoveRelationShips(idPost.PostID);
                    CountPost(idPost.PostID);
                }
            }



        }
        /// <summary>
        /// Trả về tất cả danh mục của một bài viết
        /// </summary>
        /// <param name="post_name">post_name của bài viết</param>
        /// <returns>Tất cả Danh mục của bài viết</returns>
        public static IEnumerable<Category> GetCategories(string post_name, string taxonomy = "category")
        {

            Posts post = Get(post_name);
            if (post != null)
            {
                var posts = db.Posts.Include("Category").Where(p => p.Name == post_name).FirstOrDefault();

                IEnumerable<Category> t = posts.Category.Where(o => o.CategoryType == taxonomy);

                if (t != null) return t;
            }
            return null;

        }

        /// <summary>
        /// Trả về danh mục của một bài viết
        /// </summary>
        /// <param name="post_name">post_name của bài viết</param>
        /// <returns>Danh mục của bài viết</returns>
        public static Category GetCategory(string post_name, string taxonomy = "category")
        {

            var post = Get(post_name);

            if (post != null)
            {
                var posts = db.Posts.Include("Category").Where(p => p.Name == post_name).FirstOrDefault();

                if (posts != null)
                {
                    IEnumerable<Category> result = posts.Category.Where(o => o.CategoryType == taxonomy);


                    if (result.Count() > 1)
                    {
                        return posts.Category.Where(o => o.CategoryType == taxonomy && o.CategoryParent != 0).FirstOrDefault();
                    }
                    else
                    {
                        return result.FirstOrDefault();
                    }
                }

            }
            return null;
        }

        /// <summary>
        /// Xoá một tag của bài viết.
        /// </summary>
        /// <param name="post_name">post_name của bài viết</param>
        public static void DeleteTag(string post_name, string taxonomy = "tag")
        {
            var sql = string.Empty;
            //Xoá tag là xoá mối liên hệ giữa bài viết và tag: cập nhật lại số lượng post sử dụng tag này.
            Posts post = Get(post_name);

            if (post != null)
            {
                var idCats = GetTags((int)post.PostID, taxonomy);

                if (idCats != null)
                {
                    RemoveRelationShips(post.PostID);
                    CountPost(post.PostID);

                }
            }

        }

        /// <summary>
        /// Lấy các tag thuộc về một Post dựa vào Id của Post
        /// </summary>
        /// <param name="idPost">Id của Post</param>
        /// <returns>Các tag(chỉ là một mảng các Id của tag) của Post</returns>
        public static IEnumerable<int> GetTags(int idPost = 0, string taxonomy = "tag")
        {

            var posts = db.Posts.Include("Category").Where(p => p.PostID == idPost).FirstOrDefault();

            if (posts != null)
            {
                List<int> terms = new List<int>();

                IEnumerable<Category> categories = posts.Category.Where(o => o.CategoryType == taxonomy);

                foreach (var item in categories)
                {
                    terms.Add(Convert.ToInt32(item.CategoryID));
                }
                return terms;
            }
            return null;
        }

        /// <summary>
        /// Lấy các tag của một Post dựa vào post_name của Post
        /// </summary>
        /// <param name="post_name">post_name của Post</param>
        /// <returns>Danh mục thông tin đầy đủ về các tag của Post</returns>
        public static IEnumerable<Category> GetTags(string post_name, string taxonomy)
        {

            var posts = db.Posts.Include("Category").Where(p => p.Name == post_name).FirstOrDefault();

            if (posts != null)
            {
                List<int> terms = new List<int>();

                return posts.Category.Where(o => o.CategoryType == taxonomy);
            }
            return null;
        }


        /// <summary>
        /// Thêm một thông tin: có một bài viết mới thuộc về một danh mục nào đó
        /// Sau khi thêm thông tin về mối liên hệ này vào term_relationship thì
        /// cập nhật số lượng bài viết thuộc danh mục đó thêm 1.
        /// </summary>
        /// <param name="categories">Danh sách các danh mục có liên quan đến bài viết</param>
        /// <param name="id">Id trong trường hợp cập nhật</param>
        public static void AddLinkCategories(string categories, string name)
        {
            if (!string.IsNullOrEmpty(categories))
            {

                var listCategories = categories.Split(',').Where(t => t != string.Empty).ToArray();

                using (var context = newContext)
                {
                    var post = context.Posts.FirstOrDefault(t => t.Name == name);

                    foreach (var category in listCategories)
                    {
                        Category cat = context.Category.Find(int.Parse(category));
                        if (cat != null)
                        {
                            post.Category.Add(cat);
                            context.SaveChanges();
                        }
                    }
                    CountPost(post.PostID);
                }

            }
        }


        public static void RemoveRelationShips(decimal PostId)
        {

            using (var context = newContext)
            {
                var model = context.Posts.Include("Category").Where(p => p.PostID == PostId).FirstOrDefault();

                model.Category.Clear();
                context.SaveChanges();
            }
            CountPost(PostId);
        }

        public static void AddRelationShips(decimal PostId, decimal CategoryId)
        {

            using (var context = newContext)
            {
                var cate = context.Category.Find(CategoryId);
                var post = context.Posts.Find(PostId);

                if (cate != null && post != null)
                {
                    post.Category.Add(cate);
                    context.SaveChanges();
                }
            }
            CountPost(PostId);
        }

        public static void CountPost(decimal PostId)
        {
            using (var context = newContext)
            {
                var model = context.Posts.Include("Category").Where(p => p.PostID == PostId).FirstOrDefault();

                var categoreis = model.Category;

                if (categoreis != null)
                {
                    foreach (var cat in categoreis)
                    {
                        var cate = context.Category.Include("Posts").Where(c => c.CategoryID == cat.CategoryID).FirstOrDefault();

                        if (cate != null)
                        {
                            cate.Count = cate.Posts.Count();
                            context.Entry(cate).State = EntityState.Modified;
                            context.SaveChanges();
                        }
                    }

                }
            }

        }

        public static void CountDelete(IEnumerable<Category> categories)
        {
            using (var context = newContext)
            {

                if (categories != null)
                {
                    foreach (var cat in categories)
                    {
                        var cate = context.Category.Include("Posts").Where(c => c.CategoryID == cat.CategoryID).FirstOrDefault();

                        if (cate != null)
                        {
                            cate.Count = cate.Posts.Count();
                            context.Entry(cate).State = EntityState.Modified;
                            context.SaveChanges();
                        }
                    }

                }
            }

        }

        public static void Create(Posts post)
        {
            using (var context = newContext)
            {                
                if (string.IsNullOrWhiteSpace(post.Name))
                {
                    post.Name = Util.CreatePostNameFriendly(post.Title, CheckPostNameExists);
                }
                else
                {
                    post.Name = Util.CreatePostNameFriendly(post.Name, CheckPostNameExists);
                }
                context.Posts.Add(post);
                context.SaveChanges();
            }
        }

        public static void Update(Posts post)
        {            
            if (string.IsNullOrWhiteSpace(post.Name))
            {
                post.Name = Util.CreatePostNameFriendly(post.Title, CheckPostNameExists, int.Parse(post.PostID.ToString()));
            }
            else
            {
                post.Name = Util.CreatePostNameFriendly(post.Name, CheckPostNameExists, int.Parse(post.PostID.ToString()));
            }

            using (var context = newContext)
            {
                context.Entry(post).State = EntityState.Modified;
                context.SaveChanges();
            }
        }


        public static void Delete(long PostId)
        {
            using (var context = newContext)
            {
                var post = context.Posts.Include(c=>c.Category).Where(p => p.PostID == PostId).FirstOrDefault();

                if (post != null)
                {
                    Category[] cate = new Category[post.Category.Count()];                    
                    post.PostMeta.Clear();
                    post.Category.CopyTo(cate, 0);
                    post.Category.Clear();
                    context.Posts.Remove(post);
                    context.SaveChanges();
                    CountDelete(cate);

                }
            }

        }                 
    }
}
