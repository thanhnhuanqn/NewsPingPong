using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class CommentModel : DBContext
    {
        public static IEnumerable<Comments> GetAll(string orderby = null, decimal postid = 0, string search = null, string type = null)
        {

            using (var db = newContext)
            {
                var model = db.Comments.Where(c => c.CommentType == type).OrderByDescending(c => c.DateCreated);

                if (postid != 0)
                {
                    model = db.Comments.Where(c => c.CommentType == type && c.PostID == postid).OrderByDescending(c => c.DateCreated);
                }

                if (orderby != null)
                {
                    model = db.Comments.Where(c => c.CommentType == type && c.PostID == postid).OrderByDescending(c => c.DateCreated);
                }

                return model;
            }

        }

        /// <summary>
        /// Lấy bài viết mà comment này thuộc về
        /// </summary>
        /// <param name="comment_id">id của comment</param>
        /// <returns>Đối tượng post là bài viết</returns>
        public static Posts getPostofComment(int comment_id)
        {
            using (var db = newContext)
            {
                var model = db.Comments.Find(comment_id);

                if (model != null)
                {
                    return db.Posts.Find(model.PostID);
                }

                return null;
            }

        }

        public static void Update(Comments newData, Comments olData)
        {
            if (olData != null)
            {
                using (var context = newContext)
                {
                    newData.Agent = olData.Agent;
                    newData.CommentParent = olData.CommentParent;
                    newData.CommentType = olData.CommentType;
                    newData.AuthorIP = olData.AuthorIP;
                    context.Entry(newData).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
        }

        public static void Unapprove(long commentID)
        {
            using (var context = newContext)
            {
                context.Configuration.AutoDetectChangesEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;

                var comment = context.Comments.Find(commentID);
                comment.Approved = "0";
                context.Entry(comment).State = EntityState.Modified;
                context.SaveChanges();
            }
        }

        public static void Approve(Comments data)
        {
            using (var context = newContext)
            {
                context.Configuration.AutoDetectChangesEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;

                var comment = context.Comments.Find(data.CommentID);
                comment.Approved = "1";
                context.Entry(comment).State = EntityState.Modified;
                context.SaveChanges();
            }
        }


        private static void UpdateCommentCount(decimal? id)
        {
            using (var db = newContext)
            {
                var p = db.Posts.Find(id);

                if (p != null)
                {
                    var countPost = db.Comments.Where(t => t.PostID == id).Count();

                    using (var context = newContext)
                    {
                        p.CommentCount = countPost;
                        context.Entry(p).State = EntityState.Modified;
                        context.SaveChanges();
                    }
                }
            }

        }

        public static void Delete(Comments comment)
        {
            using (var context = newContext)
            {
                var check = context.Comments.Find(comment.CommentID);
                if (check != null)
                {
                    context.Comments.Remove(check);
                    context.SaveChanges();
                    UpdateCommentCount(comment.PostID);
                }
            }
        }


        internal static void Create(Comments comment)
        {
            using (var context = newContext)
            {
                context.Comments.Add(comment);
                context.SaveChanges();
            }

            using (var context = newContext)
            {
                var post = context.Posts.Find(comment.PostID);
                if (post != null)
                {
                    post.CommentCount = post.CommentCount + 1;
                    
                    context.Entry(post).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }
        }
    }
}