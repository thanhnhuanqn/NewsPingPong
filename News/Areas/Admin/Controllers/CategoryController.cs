using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;
using System.Data.Entity;

namespace News.Areas.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        private NewsEntities db = new NewsEntities();

        public ActionResult Index()
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");
            ViewBag.Term = new Category();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Category term)
        {
            if (string.IsNullOrEmpty(term.CategoryName))
            {
                ModelState.AddModelError("CategoryName", "Nhập tên danh mục");
            }

            if (!string.IsNullOrEmpty(term.Slug) && term.Slug.Contains(" "))
            {
                ModelState.AddModelError("Slug", "URL chỉ chứa ký tự và đấu gạch nối");
            }

            if (ModelState.IsValid)
            {
                term.CategoryName = TermModel.Trim(term.CategoryName);
                term.Slug = TermModel.Trim(term.Slug);
                term.Description = TermModel.Trim(term.Description);

                if (string.IsNullOrWhiteSpace(term.Slug))
                {
                    term.Slug = Util.CreatePostNameFriendly(term.CategoryName, checkSlugExists);
                }
                else
                {
                    term.Slug = Util.CreatePostNameFriendly(term.Slug, checkSlugExists);
                }

                term.CategoryType = "category";
                term.CategoryParent = term.CategoryParent;
                term.Count = 0;

                db.Category.Add(term);
                db.SaveChanges();

                this.FlashSuccess("Created success");

                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");
                ViewBag.Term = new Category();
                return View("Index");
            }

        }

        public ActionResult Edit(string slug)
        {
            ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");

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
                ModelState.AddModelError("CategoryName", "Nhập tên danh mục");
            }

            if (!string.IsNullOrEmpty(term.Slug) && term.Slug.Contains(" "))
            {
                ModelState.AddModelError("Slug", "URL chỉ chứa ký tự và đấu gạch nối");
            }
            var model = db.Category.Find(term.CategoryID);

            if (ModelState.IsValid && model != null)
            {                
                term.CategoryName = TermModel.Trim(term.CategoryName);
                term.Slug = TermModel.Trim(term.Slug);
                term.Description = TermModel.Trim(term.Description);

                if (string.IsNullOrWhiteSpace(term.Slug))
                {
                    term.Slug = Util.CreatePostNameFriendly(term.CategoryName, checkSlugExists, (int)model.CategoryID);
                }
                else
                {
                    term.Slug = Util.CreatePostNameFriendly(term.Slug, checkSlugExists, (int)model.CategoryID);
                }



                term.CategoryType = model.CategoryType;
                term.Count = model.Count;

                using (var context = new NewsEntities())
                {
                    context.Entry(term).State = EntityState.Modified;
                    context.SaveChanges();
                }
                this.FlashSuccess("Update success");
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Categories = db.Category.Where(p => p.CategoryType == "category");
                ViewBag.Term = term;
                return View("Index");
            }
        }

        [HttpPost]
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
            this.FlashDanger("Deleted success");
            return RedirectToAction("Index");
        }

        private void Delete(string slug)
        {
            var model = db.Category.Where(t => t.Slug == slug).FirstOrDefault();

            if (model != null)
            {
                //db.PROC_UPDATE_PARENT(model.CategoryID);
                db.Category.Remove(model);
                db.SaveChanges();
            }

        }

        private bool checkSlugExists(int id, string slug)
        {
            return GetAllSlug(slug, id) >= 1 ? true : false;
        }

        public int GetAllSlug(string slug, int id)
        {

            var model = db.Category;

            var result = model.Where(p => p.Slug == slug);

            if (id > 0)
            {
                result = from item in model where item.Slug == slug && item.CategoryID != id select item;
            }

            return result.Count();
        }
    }
}