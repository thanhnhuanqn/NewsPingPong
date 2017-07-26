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
    public class CommentController : BaseController
    {
        NewsEntities db = new NewsEntities();

        // GET: Admin/Comment
        public ActionResult Index()
        {
            ViewBag.Comments = db.Comments.Where(c => c.CommentType == "post");
            return View();

        }

        // GET: Admin/Comment
        public ActionResult Edit(string slug)
        {
            var model = db.Comments.Find(int.Parse(slug));
            if (model != null)
            {
                return View(model);
            }
            this.FlashDanger("Comment not found");
            return RedirectToAction("Index");

        }


        [HttpPost]
        public ActionResult Edit(Comments comment)
        {
            try
            {
                var model = db.Comments.Find(comment.CommentID);

                if (model != null)
                {
                    comment.DateCreated = Util.SetupDateTime(_int(Request["yy"]), _int(Request["mm"]), _int(Request["dd"]), _int(Request["hh"]), _int(Request["mi"]));
                    CommentModel.Update(comment, model);
                }
                this.FlashSuccess("Update success");
                return Redirect("~/admin/comment/edit/" + model.CommentID);
            }
            catch (Exception ex)
            {
                this.FlashDanger(ex.Message);
            }

            return RedirectToAction("Index");

        }

        private int _int(string p)
        {
            return int.Parse(p);
        }

        public ActionResult Unapprove(string slug)
        {
            if (!string.IsNullOrEmpty(slug))
            {
                try
                {
                    var model = db.Comments.Find(int.Parse(slug));
                    if (model != null)
                    {
                        CommentModel.Unapprove(model.CommentID);
                        this.FlashSuccess("Unapprove success");                        
                    }
                }
                catch (Exception ex)
                {
                    this.FlashDanger(ex.Message);
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult Approve(string slug)
        {
            if (!string.IsNullOrEmpty(slug))
            {
                try
                {
                    var model = db.Comments.Find(int.Parse(slug));
                    if (model != null)
                    {
                        CommentModel.Approve(model);

                        this.FlashSuccess("Approve success");                        
                    }
                }
                catch (Exception ex)
                {
                    this.FlashDanger(ex.Message);
                }

            }

            return RedirectToAction("Index");
        }

        public ActionResult Delete(string slug)
        {
            if (!string.IsNullOrEmpty(slug))
            {
                try
                {
                    var model = db.Comments.Find(int.Parse(slug));
                    if (model != null)
                    {

                        CommentModel.Delete(model);

                        this.FlashDanger("Delete success");
                        return RedirectToAction("Index");

                    }
                }
                catch (Exception ex)
                {
                    this.FlashDanger(ex.Message);
                }
            }

            return RedirectToAction("Index");
        }

        public ActionResult DeleteList()
        {
            var listIdComment = Request["actionDelete"];

            if (!string.IsNullOrEmpty(listIdComment))
            {
                string[] arraySlug = listIdComment.Split(',').Where(p => p != string.Empty).ToArray();

                if (arraySlug.Count() > 0)
                {
                    foreach (var comment_Id in arraySlug)
                    {
                        CommentModel.Delete(db.Comments.Find(int.Parse(comment_Id)));
                    }
                }
                this.FlashDanger("Delete success");
            }
            return RedirectToAction("Index");
        }


    }
}