using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;

namespace News.Areas.Admin.Controllers
{
    public class MenuController : BaseController
    {
        // GET: Admin/Menu
        public ActionResult Index()
        {
            ViewBag.Pages = PostModel.GetAll(type: "page", orderby: "post_date DESC");
            ViewBag.Terms = TermModel.GetAll("category");
            ViewBag.NavMenu = TermModel.GetAll("nav-menu");
            ViewBag.PagesChild = PageModel.GetAllChildPages();

            return View();
        }

        // GET: Admin/Menu
        public ActionResult Edit(string slug)
        {
            var menu_name = slug;

            ViewBag.Menu = TermModel.Get(slug);

            ViewBag.Pages = PostModel.GetAll(type: "page", orderby: "post_date DESC");
            ViewBag.Terms = TermModel.GetAll("category");
            ViewBag.NavMenu = TermModel.GetAll("nav-menu");
            ViewBag.PagesChild = PageModel.GetAllChildPages();

            return View();
        }


        [HttpPost]
        public ActionResult Create()
        {
            var menuName = Request["menu-name"];
            if (menuName != null)
            {
                var term = new Category();

                term.CategoryName = menuName;
                term.CategoryParent = 0;
                term.Count = 0;
                term.Description = "Menu";
                term.CategoryType = "nav-menu";
                try
                {
                    TermModel.Add(term);
                    this.FlashSuccess("Created success");
                    ViewBag.ThongDiep = "Tạo thành công";
                }
                catch (Exception ex)
                {
                    this.FlashWarning(ex.Message);
                }

            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AddToMenu()
        {
            dynamic ItemsMenu = new ExpandoObject();

            ItemsMenu.menu_name_group = Request["menu-name-group"];
            ItemsMenu.menu_item_page = Request["menu-item-object"];
            ItemsMenu.menu_item_category = Request["postCategories"];
            ItemsMenu.menu_item_url = Request["menu-item-url"];
            ItemsMenu.menu_item_title = Request["menu-item-title"];

            MenuModel.AddToMenu(ItemsMenu);

            if (!string.IsNullOrEmpty(ItemsMenu.menu_name_group))
            {
                Category menu_name = TermModel.Get(int.Parse(ItemsMenu.menu_name_group));
                return Redirect("~/admin/menu/edit/" + menu_name.Slug);
            }

            return RedirectToAction("Index");

        }


        [HttpPost]
        public ActionResult UpdateItems()
        {
            var menu_item_name = Request["menu-item-name"];
            var menu_item_order = Request["menu-item-order"];
            var menu_item_id = Request["menu-item-id"];
            var nav_item_parent = Request["nav-item-parent"];

            MenuModel.UpdateMenuItems(menu_item_id, menu_item_name, menu_item_order, nav_item_parent);

            return Redirect(Request.UrlReferrer.OriginalString);
        }

        public ActionResult RemoveItem(string slug)
        {
            var getSlugPost = PostModel.Get(Convert.ToInt32(slug));

            string slugTerm = string.Empty;

            if (getSlugPost != null)
            {
                slugTerm = MenuModel.getMenuNavByPostId(getSlugPost.PostID);

                MenuModel.RemoveItemMenu((int)getSlugPost.PostID);

                if (!string.IsNullOrEmpty(slugTerm))
                {
                    return Redirect("~/admin/menu/edit/" + slugTerm ?? string.Empty);
                }
            }

            return RedirectToAction("Index");
        }

        public ActionResult Delete(string slug)
        {
            if (!string.IsNullOrEmpty(slug))
            {
                MenuModel.DeleteNavMenu(slug);
            }

            return RedirectToAction("Index");
        }



    }
}