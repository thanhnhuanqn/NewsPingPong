using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;
using News.Areas.Admin.Models;

namespace News.Areas.Admin.Controllers
{
    public class PostController : BaseController
    {
        NewsEntities db = new NewsEntities();

        private int _int(dynamic iNumber)
        {
            return int.Parse(iNumber.ToString());
        }

        // GET: Admin/Post
        public ActionResult Index()
        {
            string post_type = Request["post_type"] ?? "post" ;

            string post_status = Request["post_status"];

            string search = Request["search"];

            string category = Request["category"];

            string tag = Request["tag"];

            if (!string.IsNullOrEmpty(post_status))
            {                
                return View(db.Posts.Include("Category").Where(p => p.Type == post_type && p.Status == post_status).OrderByDescending(c => c.PostID));
            }
            if (!string.IsNullOrEmpty(search))
            {
                return View(db.Posts.Include("Category").Where(p => p.Title.ToLower().Contains(search.ToLower().Trim()) && p.Type == "post").OrderByDescending(c => c.PostID));
            }

            if (!string.IsNullOrEmpty(category))
            {
                var categoryPost = db.Category.Include("Posts").Where(c => c.Slug == category).FirstOrDefault();
                if (categoryPost != null)
                {
                    var posts = categoryPost.Posts;
                    if (posts != null)
                    {
                        return View(posts.OrderByDescending(c=>c.PostID));
                    }
                }
            }
            return View(db.Posts.Include("Category").Where(p => p.Type == post_type).OrderByDescending(c => c.PostID));
        }

        // GET: Admin/Post
        public ActionResult Create()
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");
            return View(new Posts());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Posts p)
        {
            var categories = Request["categories"];
            var tags = Request["tags"];
            var sticky = Request["sticky"];
            var keyword = Request["keyword"];
            var description = Request["description"];



            if (string.IsNullOrEmpty(categories))
            {
                ModelState.AddModelError("Categories", "Category is not set");
            }

            if (ModelState.IsValid)
            {
                
                p.Parent = 0;
                p.UserID = SecurityModel.CurrentUserId;
                p.Type = "post";
                p.Created = DateTime.Now;
                p.Modified = p.Created;
                p.CommentStatus = "Open";
                p.CommentCount = 0;

                if (string.IsNullOrEmpty(p.Name))
                {
                    p.Name = p.Title;
                }
                
                PostModel.Create(p);

                var postNew = PostModel.Get(p.Name);

                if (postNew != null)
                {
                    if (Request["image-choose"] != null)
                    {
                        PostMetaModel.CreateKeyValue(postNew.PostID, "_thumbnail_id", Request["image-choose"]);
                    }

                    if (!string.IsNullOrEmpty(sticky))
                    { 
                        if (sticky.Equals("sticky"))
                        {
                            PostMetaModel.CreateKeyValue(postNew.PostID, "_sticky", sticky);
                        }
                    }

                    if (!string.IsNullOrEmpty(keyword.Trim()))
                    {
                        PostMetaModel.CreateKeyValue(postNew.PostID, "_keyword", keyword);
                    }

                    if (!string.IsNullOrEmpty(description.Trim()))
                    {
                        PostMetaModel.CreateKeyValue(postNew.PostID, "_description", description);
                    }
                }
                
                PostModel.AddLinkCategories(categories, p.Name);

                PostModel.AddLinkTags(tags, p.Name);

                this.FlashSuccess("Created success");

                return Redirect("~/admin/post/edit/" + p.Name);
            }
            else
            {
                ViewBag.Categories = db.Category.Where(t => t.CategoryType == "category");
                this.FlashDanger("Not success");
                return View(p);
            }                        
        }

        // GET: Admin/Post
        public ActionResult Edit(string slug)
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");
            ViewBag.Tags = db.Category.Where(p => p.CategoryType == "tag");

            var model = db.Posts.Where(p => p.Name == slug).FirstOrDefault();

            if (model != null)
            {
                return View(model);
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Posts p)
        {                                    
            if (string.IsNullOrEmpty(Request["categories"]))
            {
                ModelState.AddModelError("Categories", "Chưa chọn danh mục");
            }
            var model = db.Posts.Find(p.PostID);
            if (model != null)
            {
                var sticky = Request["sticky"];
                var keyword = Request["keyword"];
                var description = Request["description"];

                if (ModelState.IsValid)
                {
                    var categories = Request["categories"];
                    var tags = Request["tags"];

                    p.Modified = Util.SetupDateTime(_int(Request["yy"]), _int(Request["mm"]), _int(Request["dd"]), _int(Request["hh"]), _int(Request["mi"]));

                    p.Created = model.Created;
                    p.CommentCount = model.CommentCount;
                    p.CommentStatus = model.CommentStatus;
                    p.Parent = model.Parent;
                    p.UserID = model.UserID;
                    p.Type = model.Type;

                    if (string.IsNullOrEmpty(p.Name))
                    {
                        p.Name = p.Title;
                    }

                    PostModel.Update(p);

                    if (Request["image-choose"] != null)
                    {
                        PostMetaModel.CreateKeyValue(p.PostID, "_thumbnail_id", Request["image-choose"]);
                    }

                    if (!string.IsNullOrEmpty(sticky))
                    {
                        if (sticky.Equals("sticky"))
                        {
                            PostMetaModel.CreateKeyValue(p.PostID, "_sticky", sticky);
                        }
                    }
                    else
                    {
                        PostMetaModel.DeleteMetaKey(p.PostID, "_sticky");
                    }

                    if (!string.IsNullOrEmpty(keyword.Trim()))
                    {
                        PostMetaModel.CreateKeyValue(p.PostID, "_keyword", keyword);
                    }
                    else
                    {
                        PostMetaModel.DeleteMetaKey(p.PostID, "_keyword");
                    }

                    if (!string.IsNullOrEmpty(description.Trim()))
                    {
                        PostMetaModel.CreateKeyValue(p.PostID, "_description", description);
                    }
                    else
                    {
                        PostMetaModel.DeleteMetaKey(p.PostID, "_description");
                    }

                    PostModel.RemoveRelationShips(p.PostID);

                    PostModel.AddLinkCategories(categories, p.Name);

                    PostModel.AddLinkTags(tags, p.Name);

                    this.FlashSuccess("Updated success");

                    return Redirect("~/admin/post/edit/" + p.Name);
                }
                else
                {
                    ViewBag.Categories = db.Category.Where(t => t.CategoryType == "category");
                    this.FlashDanger("Not success");
                    return View(model);
                }
            } else
            {
                this.FlashDanger("Post not found");
                return RedirectToAction("Index");
            }

        }

        /// <summary>
        /// Xoa cac bai viet co id chua trong listItem
        /// </summary>
        /// <param name="listIdPost">chuoi chua cac Id cua bai viet can xoa</param>
        public ActionResult DeleteList()
        {
            string listIdPost = Request["actionDelete"];
            if (!string.IsNullOrEmpty(listIdPost))
            {

                string[] arraySlug = listIdPost.Split(',').Where(p => p != string.Empty).ToArray();

                if (arraySlug.Count() > 0)
                {
                    foreach (var idPost in arraySlug)
                    {
                        Remove(Convert.ToInt32(idPost));
                    }
                }
            }

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Xoá bỏ một loại Post bằng cách chỉ định Id hoặc post_name của nó.
        /// </summary>
        /// <param name="idPostOrPostName">ID của Post hoặc post_name của Post</param>
        public void Remove(int PostId)
        {
            PostModel.Delete(PostId);
        }
    }
}