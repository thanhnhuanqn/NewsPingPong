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
    public class TagController : BaseController
    {
        // GET: Admin/Tag
        NewsEntities db = new NewsEntities();

        public ActionResult Index()
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "tag");
            ViewBag.Term = new Category();

            return View();
        }

        [HttpPost]
        public ActionResult Create(Category term)
        {
            if (string.IsNullOrEmpty(term.CategoryName))
            {
                ModelState.AddModelError("CategoryName", "Nhập tên tag");
            }

            if (!string.IsNullOrEmpty(term.Slug) && term.Slug.Contains(" "))
            {
                ModelState.AddModelError("Slug", "URL chỉ chứa ký tự và đấu gạch nối");
            }

            if (ModelState.IsValid)
            {
                try
                {
                    TagModel.Create(term);
                    this.FlashSuccess("Created success");
                }
                catch (Exception ex)
                {
                    this.FlashWarning(ex.Message);
                }
                return RedirectToAction("Edit","Tag", term.Slug);
            }
            else
            {
                ViewBag.Categories = db.Category.Where(p => p.CategoryType == "tag");
                ViewBag.Term = new Category();
                return View("Index");
            }
            
        }


        public ActionResult Edit(string slug)
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "tag");

            var model = db.Category.Where(t => t.Slug == slug).FirstOrDefault();

            ViewBag.Term = model ?? new Category();

            if (model != null)
            {
                return View(model);
            }

            return RedirectToAction("Index");

        }
        [HttpPost]
        public ActionResult Edit(Category term)
        {
            if (string.IsNullOrEmpty(term.CategoryName))
            {
                ModelState.AddModelError("CategoryName", "Nhập tên tag");
            }

            if (!string.IsNullOrEmpty(term.Slug) && term.Slug.Contains(" "))
            {
                ModelState.AddModelError("Slug", "URL chỉ chứa ký tự và đấu gạch nối");
            }
            var model = db.Category.Find(term.CategoryID);

            if (ModelState.IsValid)
            {
                if (model != null)
                {
                    try
                    {
                        TagModel.Update(term, model);
                        this.FlashSuccess("Updated success");
                    }
                    catch (Exception ex)
                    {
                        this.FlashWarning(ex.Message);
                    }

                }
                return RedirectToAction("Edit", "Tag", term.Slug);
            }
            else
            {
                ViewBag.Categories = db.Category.Where(p => p.CategoryType == "tag");
                ViewBag.Term = term;
                return View("Index");
            }
        }

        public ActionResult DeleteMany()
        {
            var listItem = Request["actionDelete"];
            if (!string.IsNullOrEmpty(listItem))
            {

                string[] arraySlug = listItem.Split(',');

                if (arraySlug.Count() > 0)
                {
                    foreach (var slug in arraySlug)
                    {
                        Delete(slug);
                    }
                }
            }
            return RedirectToAction("Index");
        }

        private void Delete(string slug)
        {
            var model = db.Category.Include("Posts").Where(t => t.Slug == slug).FirstOrDefault();

            if (model != null)
            {
                var posts = model.Posts;
                if (posts != null)
                {
                    model.Posts.Clear();
                }
                db.Category.Remove(model);
                db.SaveChanges();
            }

        }


    }
}