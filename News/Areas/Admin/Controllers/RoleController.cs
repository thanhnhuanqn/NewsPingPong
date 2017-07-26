using News.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;

namespace News.Areas.Admin.Controllers
{
    public class RoleController : BaseController
    {
        // GET: Admin/Role
        public ActionResult Index()
        {
            ViewBag.roles = RoleModel.GetAllRoles();
            ViewBag.users = UserModel.GetAll();
            return View();
        }

        [HttpPost]
        public ActionResult DeleteUser()
        {
            var RemoveUser = Request["remove-user"];
            if (RemoveUser != null)
            {
                UserModel.Remove(RemoveUser);
                this.FlashInfo("Remove success");
            }

            return Redirect("Index");
        }

        [HttpPost]
        public ActionResult CreateRole()
        {
            var message = "";

            var newrole = Request["newrole"];

            if (!string.IsNullOrEmpty(newrole))
            {
                message = RoleModel.CreateRole(newrole);
            }
            this.FlashInfo(message);
            return Redirect("Index");
        }

        [HttpPost]
        public ActionResult AddUserToRole()
        {
            var user = Request["user"];
            var role = Request["role"];

            if (!string.IsNullOrEmpty(user) && !string.IsNullOrEmpty(role))
            {
                RoleModel.AddUserToRole(role, user);
                this.FlashInfo("Success");
                return Redirect("Index");
            }
            this.FlashInfo("Error");
            return Redirect("Index");
        }
    }
}