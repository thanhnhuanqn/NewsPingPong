using News.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: Admin/Account
        public ActionResult Login()
        {
            return View();
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        [ActionName("Login")]
        public ActionResult LoginUser(FormCollection data)
        {
            var username = Server.HtmlEncode(Request.Unvalidated["username"]);
            var password = Server.HtmlEncode(Request.Unvalidated["password"]);
            var rememberMe = false;

            if (string.IsNullOrEmpty(username))
            {
                ModelState.AddModelError("username", "Username not empty");
            }
            if (string.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("password", "Password not empty");
            }

            var user = UserModel.Get(username);
            if (user == null)
            {
                ModelState.AddModelError("username", "Username not found");
            }

            if (ModelState.IsValid)
            {

                if (SecurityModel.Login(username, password, rememberMe))
                {
                    var returnUrl = Request.QueryString["ReturnUrl"];
                    if (string.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect("~/admin");
                    }
                    else
                    {
                        return Redirect(returnUrl);
                    }
                }
                else
                {
                    ModelState.AddModelError("password", "Password not correct");
                }
            }
            return View(data);
        }

        // GET: Admin/Account
        public ActionResult Logout()
        {
            SecurityModel.Logout();
            return RedirectToAction("Login");
        }
    }
}