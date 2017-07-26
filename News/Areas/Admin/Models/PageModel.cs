using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class PageModel : PostModel
    {        

        public static IEnumerable<Posts> GetAllChildPages()
        {
            return db.Posts.Where(p => p.Parent != 0 && p.Type == "page");
        }

        public static new void Create(Posts p)
        {            
            if (string.IsNullOrEmpty(p.Name))
            {
                p.Name = p.Title;
            }

            p.Name = Util.CreatePostNameFriendly(p.Name, CheckPostNameExists);

            using (var context = newContext)
            {
                context.Posts.Add(p);
                context.SaveChanges();
            }
            var templatePage =  HttpContext.Current.Request["templPost"];

            if (!string.IsNullOrEmpty(templatePage))
            {
                addMetaPage(p.Name, "page_template", templatePage);
            }
        }

        private static void addMetaPage(string post_name, string meta_key, string meta_value)
        {
            using (var db = newContext)
            {
                var idPage = Get(post_name);

                if (idPage != null)
                {
                    PostMetaModel.CreateKeyValue(idPage.PostID, meta_key, meta_value);
                }
            }
        }        

        public static void Update(Posts newData, Posts olData)
        {

            newData.Created = olData.Created;
            newData.CommentCount = olData.CommentCount;
            newData.CommentStatus = olData.CommentStatus;
            newData.UserID = olData.UserID;
            newData.Type = olData.Type;
            newData.PostID = olData.PostID;
            newData.Modified = DateTime.Now;
            newData.CommentCount = olData.CommentCount;
            newData.CommentStatus = olData.CommentStatus;
            newData.GUID = olData.GUID;
            newData.Order = olData.Order;

            if (string.IsNullOrEmpty(newData.Name))
            {
                newData.Name = newData.Title;
            }

            newData.Name = Util.CreatePostNameFriendly(newData.Name, CheckPostNameExists, int.Parse(newData.PostID.ToString()));

            using (var context = newContext)
            {
                context.Entry(newData).State = EntityState.Modified;
                context.SaveChanges();
            }

            var templatePage = HttpContext.Current.Request["templPost"];

            if (!string.IsNullOrEmpty(templatePage))
            {
                addMetaPage(newData.Name, "page_template", templatePage);
            }


        }
    }
}