using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class PostMetaModel : DBContext
    {
        internal static NewsEntities db = new NewsEntities();
        /// <summary>
        /// Tạo key-value cho một post. Có thể là một hình ảnh featured image, sticky post,...
        /// </summary>
        /// <param name="post_id">Của post nào ?</param>
        /// <param name="meta_key">Nhận điện khoá</param>
        /// <param name="meta_value">Giá trị của khoá</param>
        public static void CreateKeyValue(long post_id, string meta_key, string meta_value)
        {
            DeleteMetaKey(post_id, meta_key);
            using (var context = newContext)
            {
                var parent = db.Posts.Find(post_id);
                if (parent != null)
                {
                    PostMeta p = new PostMeta();
                    p.PostID = post_id;
                    p.PMetaKey = meta_key;
                    p.PMetaValue = meta_value;
                    context.PostMeta.Add(p);
                    context.SaveChanges();
                }
            }
        }


        /// <summary>
        /// Lấy một khoá meta của post
        /// </summary>
        /// <param name="post_id">Của post nào</param>
        /// <param name="meta_key">Khoá cần lấy là gì ?</param>
        /// <returns>Giá trị của khoá</returns>

        public static string GetMetaKey(decimal post_id, string meta_key)
        {

            using (var context = newContext)
            {
                var result = context.PostMeta.Where(p => p.PostID == post_id && p.PMetaKey == meta_key).ToArray();

                if (result.Length > 0)
                {
                    return result.FirstOrDefault().PMetaValue;
                }

                return null;
            }
        }


        /// <summary>
        /// Xoá một khoá của post dựa vào id của post và key
        /// </summary>
        /// <param name="id">Id của bài viết</param>
        /// <param name="meta_key">Khoá nhận diện cần khoá</param>
        public static void DeleteMetaKey(decimal post_id, string meta_key)
        {

            var find = db.PostMeta.Where(p => p.PostID == post_id && p.PMetaKey == meta_key).FirstOrDefault();

            if (find != null)
            {
                db.PostMeta.Remove(find);
                db.SaveChanges();
            }

        }


        public static void UpdateMetaKey(decimal post_id, string meta_key, string value_key)
        {

            var find = db.PostMeta.Where(p => p.PostID == post_id && p.PMetaKey == meta_key).FirstOrDefault();
            if (find != null)
            {
                find.PMetaValue = value_key;
                db.Entry(find).State = EntityState.Modified;
                db.SaveChanges();
            }

        }

        public static dynamic GetAllMeta(dynamic post_id)
        {
            return db.PostMeta;
        }


    }
}