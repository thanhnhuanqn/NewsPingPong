using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Models
{
    public class BlogService
    {
        private static NewsEntities Context { get
            {
                return new NewsEntities();
            }
        }
        public static dynamic GetCategoryName(string slugCategory)
        {
            using (var db = Context)
            {
                return db.proc_GetCategoryName(slugCategory).ToList().FirstOrDefault();
            }
        }

        public static IEnumerable<dynamic> GetPostsByCategory(string slug, int take = 5, string current_post = null)
        {
            using (var db = Context)
            {
                return db.proc_GetPostsByCategory(slug, take, current_post).ToList();
            }
        }

        public static Posts[] GetPostsHot(string slug, int top = 6)
        {
            using (var db = Context)
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

        public static IEnumerable<dynamic> GetAllRecent(int take = 10)
        {
            using (var db = Context)
            {
                return db.proc_GetAllRecent(take + 10).Skip(10).Take(take).ToList();
            }
        }

        public static dynamic GetPost(string slug)
        {

            using (var db = Context)
            {
                return db.proc_GetPost(slug).FirstOrDefault();
            }

        }

        public static dynamic GetCategoryByPostName(string slug, string type = "category")
        {

            using (var db = Context)
            {
                return db.proc_GetCategoryByPostName(slug, type).ToList().FirstOrDefault();                
            }

        }

        public static dynamic GetTopView(string key, int take)
        {
            using (var db = Context)
            {
                return db.proc_GetTopView(key, take).ToList();
            }
        }

        public static dynamic GetAllTag(int take = 10)
        {
            using (var db = Context)
            {
                return db.view_GetAllTagHavePost.OrderByDescending(t=>t.Count).Take(take).ToList();
            }
        }


        public static dynamic GetTagsByPost(string postName)
        {
            using (var db = Context)
            {
                return db.proc_GetTagsByPost(postName).ToList();
            }
        }

    }
}