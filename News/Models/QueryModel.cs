using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News.Models
{
    public class QueryModel : DBContext
    {
        /// <summary>
        /// Lấy tất cả bài viết được 'publish' của một danh mục chỉ định
        /// </summary>
        /// <param name="slug">slug của category cần lấy</param>
        /// <param name="take">lấy bao nhiêu bài viết của chuyên mục này</param>
        /// <param name="current_post">Loại trừ bài viết hiện tại đang xem, nếu ở dạng bài viết chi tiết.</param>
        /// <returns>Danh sách các bài viết của danh mục cần lấy</returns>
        public static IEnumerable<Posts> GetPostsByCategory(string slug, int take = 5, string current_post = null)
        {
            Posts post = null;

            List<Posts> posts = new List<Posts>();

            dynamic result = null;

            if (current_post != null)
            {
                post = PostModel.Get(current_post);
            }
            using (var db = newContext)
            {
                var cat = TermModel.Get(slug);
                if (cat != null)
                {

                    var cate = db.Category.Include("Posts").Where(c => c.Slug == slug).FirstOrDefault();

                    result = cate.Posts.Where(p => p.Status == "publish" && p.Modified <= DateTime.Now).OrderByDescending(p => p.PostID).Take(take);

                    if (post != null)
                    {
                        result = cate.Posts.Where(p => p.Status == "publish" && p.Modified <= DateTime.Now && p.PostID != post.PostID).OrderByDescending(p => p.PostID).Take(take);
                    }
                }

                if (result != null)
                {
                    foreach (Posts id in result)
                    {
                        dynamic t = PostModel.Get(id.PostID);
                        posts.Add(t);
                    }
                    return posts;
                }
            }
            return null;

        }

        /// <summary>
        /// Lấy danh sách các viết của một Chuyên mục được chỉ định.
        /// </summary>
        /// <param name="slug">Tên chuyên mục</param>
        /// <returns>Danh sách các bài viết của Chuyên mục</returns>
        public static Posts[] GetPostsHot(string slug, int top = 6)
        {
            using (var db = newContext)
            {
                var cate = db.Category.Include("Posts").Where(c => c.Slug == slug).FirstOrDefault();

                if (cate != null)
                {
                    var posts = cate.Posts;
                    if (posts != null)
                    {
                        return posts.Where(p => p.Status == "publish" && p.Modified <= DateTime.Now).OrderByDescending(p => p.PostID).Take(top).ToArray();
                    }
                }
                return null;
            }
        }


        public static Posts[] GetMenuItemById(decimal idTerm = -1)
        {
            using (var db = newContext)
            {

                var cate = db.Category.Include("Posts").Where(c => c.CategoryID == idTerm).FirstOrDefault();

                var posts = cate.Posts;

                if (posts != null)
                {
                    return posts.Where(p => p.Type == "nav_menu_item").OrderBy(p => p.Order).ToArray();
                }

                return null;
            }
        }
        /// <summary>
        /// Lam new feed hot news
        /// </summary>
        /// <param name="take"></param>
        /// <returns></returns>
        public static Posts[] GetTitleHotNews(int take)
        {
            using (var db = newContext)
            {

                var posts = db.Posts.Where(p => p.Type == "post" && p.Created <= DateTime.Now).Take(take);

                if (posts != null)
                {
                    return posts.ToArray();
                }

                return null;
            }
        }

        public static Posts[] GetAllPosts(int take = 10)
        {
            using (var db = newContext)
            {
                return db.Posts.Where(p => p.Created <= DateTime.Now && p.Status == "publish" && p.Type == "post").OrderByDescending(p => p.PostID).Skip(10).Take(take).ToArray();
            }
        }

        public static List<Comments> GetComments(decimal PostID, string type = "post")
        {
            return CommentModel.GetAll(postid: PostID, type: type).ToList();
        }

    }
}