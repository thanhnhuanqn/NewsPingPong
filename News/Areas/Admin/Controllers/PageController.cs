using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;
using System.Data.Entity;
using News.Areas.Admin.Models;

namespace News.Areas.Admin.Controllers
{
    public class PageController : BaseController
    {
        NewsEntities db = new NewsEntities();

        private int _int(dynamic iNumber)
        {
            return int.Parse(iNumber.ToString());
        }

        // GET: Admin/Post
        public ActionResult Index()
        {
            ViewBag.PagesChild = db.Posts.Where(p => p.Type == "page" && p.Parent != 0);
            return View(db.Posts.Where(p => p.Type == "page"));
        }

        // GET: Admin/Post
        public ActionResult Create()
        {
            ViewBag.Pages = db.Posts.Where(p => p.Type == "page");
            return View(new Posts());
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Posts p)
        {                        
            p.Type = "page";
            p.Created = DateTime.Now;
            p.CommentCount = 0;
            p.Modified = p.Created;
            p.CommentStatus = "Open";            
            p.UserID = SecurityModel.CurrentUserId;


            if (string.IsNullOrEmpty(p.Title))
            {
                ModelState.AddModelError("Title", "Chưa nhập tiều đề bài viết");
            }

            if (string.IsNullOrEmpty(p.Content))
            {
                ModelState.AddModelError("Content", "Chưa nhập nội dung");
            }            

            if (!string.IsNullOrEmpty(p.Name) && p.Name.Contains(" "))
            {
                ModelState.AddModelError("Name", "URL không chứa khoảng trắng và các ký tự đặc biệt");
            }

            if (ModelState.IsValid)
            {
                try
                {
                    PageModel.Create(p);
                    
                    this.FlashSuccess("Created success");
                }
                catch (Exception ex)
                {
                    this.FlashWarning(ex.Message);
                }

                return Redirect("~/admin/page/edit/" + p.Name);
            }

            this.FlashDanger("Not success");
            ViewBag.Pages = db.Posts.Where(c => c.Type == "page");
            return View(p);
        }

        // GET: Admin/Post
        public ActionResult Edit(string slug)
        {
            ViewBag.Pages = db.Posts.Where(p => p.Type == "page");

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

            if (string.IsNullOrEmpty(p.Title))
            {
                ModelState.AddModelError("Title", "Chưa nhập tiều đề bài viết");
            }

            if (string.IsNullOrEmpty(p.Content))
            {
                ModelState.AddModelError("Content", "Chưa nhập nội dung");
            }

            if (!string.IsNullOrEmpty(p.Name) && p.Name.Contains(" "))
            {
                ModelState.AddModelError("Name", "URL không chứa khoảng trắng và các ký tự đặc biệt");
            }
            var model = db.Posts.Find(p.PostID);

            if (model != null)
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        p.Modified = Util.SetupDateTime(_int(Request["yy"]), _int(Request["mm"]), _int(Request["dd"]), _int(Request["hh"]), _int(Request["mi"]));
                        PageModel.Update(p, model);
                        this.FlashSuccess("Updated success");
                    }
                    catch (Exception ex)
                    {
                        this.FlashDanger(ex.Message);
                    }

                    return Redirect("~/admin/page/edit/" + p.Name);
                }
                else
                {
                    this.FlashDanger("Not success");
                    ViewBag.Pages = db.Posts.Where(c => c.Type == "page");
                    return View(model);
                }
            } else
            {
                this.FlashDanger("Page not found");
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
            Posts model = db.Posts.Include("PostMeta").Where(p=>p.PostID == PostId).FirstOrDefault();

            if (model != null)
            {
                var child = model.PostMeta;
                if (child != null)
                {
                    model.PostMeta.Clear();
                    db.Posts.Remove(model);
                    db.SaveChanges();
                }
            }
        }
    }
}