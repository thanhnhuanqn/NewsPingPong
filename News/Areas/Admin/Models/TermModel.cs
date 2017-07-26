using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class TermModel : DBContext
    {
        internal static NewsEntities db = new NewsEntities();

        public static string Trim(string text)
        {
            if (!string.IsNullOrEmpty(text))
            {
                return text.Trim();
            }
            return "";
        }

        /// <summary>
        /// Lấy một danh mục theo Id
        /// </summary>
        /// <param name="id">Id của danh mục</param>
        /// <returns>Thông tin của Danh mục</returns>
        public static Category Get(decimal id)
        {
            return db.Category.Find(id);
        }

        /// <summary>
        /// Lấy thông tin của một danh mục theo url friendly
        /// </summary>
        /// <param name="slug">tên slug của danh mục</param>
        /// <returns>Thông tin của danh mục cần lấy</returns>
        public static Category Get(string slug)
        {
            var result = db.Category.Where(t => t.Slug == slug);
            if (result != null)
            {
                return result.FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Lấy tất cả các danh mục hiện có.
        /// </summary>
        /// <param name="type">Kiểu cần lấy.</param>
        /// <returns>Danh sách thông tin đầy đủ của các Danh mục (terms)</returns>
        public static IEnumerable<Category> GetAll(string type = null)
        {
            if (type != null)
            {
                return db.Category.Where(t => t.CategoryType == type);

            }
            return db.Category;

        }
        /// <summary>
        /// Đếm xem slug đưa vào đã có trong cơ sở dữ liệu hay chưa ?
        /// (Không lấy Id của danh mục đưa vào). Nếu có thì phải tạo slug khác đi.
        /// Thực chất là mỗi danh mục chỉ có một slug duy nhất, việc này chỉ kiểm tra và dùng để tạo slug khác nhau
        /// nếu tạo các danh mục có cùng tên
        /// </summary>
        /// <param name="slug">slug của danh mục cần lấy</param>
        /// <param name="id">id của slug</param>
        /// <returns>Trả về số danh mục có slug đưa vào.</returns>
        public static int GetAllSlug(string slug, int id)
        {
            using (var context = newContext)
            {
                if (id > 0)
                {
                    return context.Category.Where(t => t.Slug == slug && t.CategoryID != id).Count();
                }
                return context.Category.Where(t => t.Slug == slug).Count();
            }
        }
        /// <summary>
        /// Hàm kiểm tra xem có tồn tại một slug trong cơ sở dữ liệu không ?
        /// Việc này nhằm đảm bảo mỗi slug là duy nhất trong CSDL.
        /// </summary>
        /// <param name="id">ID của slug - không tìm chính nó</param>
        /// <param name="slug">slug cần tìm</param>
        /// <returns>True | False</returns>
        public static bool checkSlugExists(int id, string slug)
        {
            return GetAllSlug(slug, id) >= 1 ? true : false;
        }


        public static void Add(Category term)
        {
            using (var context = newContext)
            {
                term.Slug = Util.CreatePostNameFriendly(term.CategoryName, checkSlugExists);
                context.Category.Add(term);
                context.SaveChanges();
            }
        }



        /// <summary>
        /// Xoá bỏ Danh mục dựa vào slug của nó.
        /// </summary>
        /// <param name="slug">slug của Danh mục cần xoá</param>
        public static void Remove(string slug)
        {
            var result = Get(slug);

            if (result != null)
            {

                var sql = string.Empty;

                //db.PROC_UPDATE_PARENT(result.TermID);

                var posts = GetPosts(result.CategoryID);

                foreach (var item in posts)
                {
                    //db.PROC_DELETE_RELATIONSHIPS(result.CategoryID, item.PostID);
                }

                using (var context = newContext)
                {
                    result = context.Category.Find(result.CategoryID);

                    context.Category.Remove(result);
                    context.SaveChanges();
                }


            }

        }

        public static IEnumerable<Posts> GetPosts(decimal idTerm)
        {

            return db.Posts.Include(p => p.Category).Where(t => t.Category.Where(i => i.CategoryID == idTerm).Count() > 0);
        }


        public static void Edit(Category term)
        {
            var check = Get(term.CategoryID);

            if (check != null)
            {
                string name = string.Empty;
                string slug = string.Empty;
                string description = string.Empty;
                try
                {
                    name = term.CategoryName.Trim();
                    slug = term.Slug.Trim();
                    description = term.Description.Trim();
                }
                catch { }

                if (string.IsNullOrWhiteSpace(slug))
                {
                    if (!string.IsNullOrEmpty(name))
                        slug = Util.UrlFriendly(name);
                }

                slug = Util.CreatePostNameFriendly(slug, checkSlugExists);

                term.Slug = slug;
                term.CategoryName = name;
                term.Description = description;
                term.CategoryType = check.CategoryType;

                db.Entry(term).State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        /// <summary>
        /// Xoá nhiều Danh mục dựa vào danh sách ID đưa vào.
        /// </summary>
        /// <param name="listItem">
        ///     Danh sách chứa các Id của các Danh mục cần xoá
        ///     một chuổi các Id được ngăn cách bởi dấu phảy.
        /// </param>
        public static void DeleteListCategory(string listItem)
        {
            if (!string.IsNullOrEmpty(listItem))
            {

                string[] arraySlug = listItem.Split(',');

                if (arraySlug.Count() > 0)
                {
                    foreach (var slug in arraySlug)
                    {
                        Remove(slug);
                    }
                }
            }
        }
    }
}