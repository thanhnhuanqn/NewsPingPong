using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;

namespace News.Areas.Admin.Controllers
{
    public class OptionController : BaseController
    {
        // GET: Admin/Option
        public ActionResult Index()
        {
            OptionModel.GetOptions();
            return View();
        }

        // GET: Admin/Option
        public ActionResult Media()
        {
            OptionModel.GetOptions();
            return View();
        }

        [HttpPost]
        public ActionResult Media(FormCollection data)
        {
            int thumbnail_size_w = int.Parse(Request["thumbnail_size_w"]);
            int thumbnail_size_h = int.Parse(Request["thumbnail_size_h"]);
            int thumbnail_crop = int.Parse(Request["thumbnail_crop"]);
            int medium_size_w = int.Parse(Request["medium_size_w"]);
            int medium_size_h = int.Parse(Request["medium_size_h"]);
            int large_size_w = int.Parse(Request["large_size_w"]);
            int large_size_h = int.Parse(Request["large_size_h"]);

            Dictionary<dynamic, dynamic> option = new Dictionary<dynamic, dynamic>();

            option.Add("thumbnail_size_w", thumbnail_size_w);
            option.Add("thumbnail_size_h", thumbnail_size_h);
            option.Add("thumbnail_crop", thumbnail_crop);
            option.Add("medium_size_w", medium_size_w);
            option.Add("medium_size_h", medium_size_h);
            option.Add("large_size_w", large_size_w);
            option.Add("large_size_h", large_size_h);
            try
            {


                OptionModel.Create(option);

                OptionModel.GetOptions();

                foreach (var file in Util.GetAllPagesInFolder("~/uploads", "*.*"))
                {
                    Util.DeleteFile(file, "~/Uploads/thumb");
                    Util.DeleteFile(file, "~/Uploads/medium");
                    Util.DeleteFile(file, "~/Uploads/large");

                    //Thumbs]
                    var file_name = file.Split('/').Reverse().ToList();

                    Util.createImage(width: OptionModel.ThumbnailW, height: OptionModel.ThumbnailH, file_name: file_name[0], folderSaveFile: @"~\uploads\thumb\");
                    Util.createImage(width: OptionModel.MediumW, height: OptionModel.MediumH, file_name: file_name[0], folderSaveFile: @"~\uploads\medium\");
                    Util.createImage(width: OptionModel.LargeW, height: OptionModel.LargeH, file_name: file_name[0], folderSaveFile: @"~\uploads\large\");
                }

                this.FlashSuccess("Update success");
            } catch(Exception ex)
            {
                this.FlashDanger(ex.Message);
            }
            return RedirectToAction("Media");
        }


        // GET: Admin/Option
        public ActionResult General()
        {
            OptionModel.GetOptions();
            ViewBag.Roles = RoleModel.GetAllRoles();
            return View();
        }


        // GET: Admin/Option
        [HttpPost]
        public ActionResult General(FormCollection data)
        {
            AntiForgery.Validate();

            var blogname = Request["blogname"];

            var blogdescription = Request["blogdescription"];

            var admin_email = Request["admin_email"];

            var users_can_register = Request["users_can_register"];

            var default_role = Request["default_role"] ?? "Subcrip";

            var default_category = Request["default_category"] ?? "post";

            var mailserver_url = Request["mailserver_url"];

            dynamic mailserver_port = Request["mailserver_port"];

            var mailserver_login = Request["mailserver_login"];

            var mailserver_pass = Request["mailserver_pass"];

            var default_email_category = Request["default_email_category"] ?? "mail";

            dynamic posts_per_page = Request["posts_per_page"];

            Dictionary<dynamic, dynamic> option = new Dictionary<dynamic, dynamic>();

            option.Add("blogname", blogname);
            option.Add("blogdescription", blogdescription);
            option.Add("admin_email", admin_email);
            option.Add("users_can_register", users_can_register);
            option.Add("default_role", default_role);
            option.Add("default_category", default_category);
            option.Add("mailserver_url", mailserver_url);
            option.Add("mailserver_login", mailserver_login);
            option.Add("mailserver_port", mailserver_port);
            option.Add("mailserver_pass", mailserver_pass);
            option.Add("default_email_category", default_email_category);
            option.Add("posts_per_page", posts_per_page);

            OptionModel.Create(option);
            
            OptionModel.GetOptions();

            this.FlashSuccess("Update success");

            return RedirectToAction("General");
        }


        // GET: Admin/Option
        public ActionResult ServerInfo()
        {
            return View();
        }


    }
}