using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;
using System.Web.Security;
using System.Web.Helpers;
using System.Web.WebPages;
using News.Areas.Admin.Controllers.Components;

namespace News.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {

        NewsEntities db = new NewsEntities();

        // GET: Admin/User
        public ActionResult Index()
        {
            ViewBag.Roles = RoleModel.GetAllRoles();
            return View();
        }

        // GET: Admin/User
        public ActionResult Edit(string slug)
        {
            var user = UserModel.Get(slug);
            if (user != null)
            {
                ViewBag.Roles = RoleModel.GetAllRoles();
                return View(user);
            }
            return Redirect("Index");
        }

        [HttpPost]
        public ActionResult Update(Users data)
        {
            var usr = UserModel.Get(data.UserID);

            if (usr != null)
            {

                var username = usr.UserName;
                var nickname = Request["NickName"];
                var description = Request["description"];

                var email = Request["Email"];

                var firstname = Request["firstname"];

                var lastname = Request["lastname"];

                var website = Request["Url"];


                var password = Request["password"];
                var password2 = Request["password2"];
                var password_old = Request["password_old"];

                var role = Request["role"];


                var checkUserName = db.Users.Where(u => u.UserName == username && u.UserName != usr.UserName).FirstOrDefault();
                if (checkUserName != null)
                {
                    ModelState.AddModelError("username", "!!!!!!");
                }

                var checkEmail = db.Users.Where(e => e.Email == email && usr.Email != email).FirstOrDefault();
                if (checkEmail != null)
                {
                    ModelState.AddModelError("email", "Email này dã có, hãy chọn một email khác");
                }


                if (string.IsNullOrEmpty(username))
                {
                    ModelState.AddModelError("username", "Username can't not empty");
                }

                if (string.IsNullOrEmpty(email))
                {
                    ModelState.AddModelError("Email", "Email can't not empty");
                }

                if (!string.IsNullOrEmpty(email))
                {
                    if (!Util.IsValidEmail(email))
                    {
                        ModelState.AddModelError("Email", "Email invalid format");
                    }
                }

                if (!string.IsNullOrEmpty(password_old))
                {
                    if (!string.IsNullOrEmpty(password) && password2 != password)
                    {
                        this.FlashDanger("Your password miss match");
                        return Redirect("~/admin/user/edit/" + username);
                    }
                    else
                    {
                        if (!Crypto.VerifyHashedPassword(usr.UserPassword, password_old + usr.ActivationKey))
                        {
                            this.FlashDanger("Password old not correct");
                            return Redirect("~/admin/user/edit/" + username);
                        }
                    }
                }


                if (string.IsNullOrEmpty(email))
                {
                    this.FlashDanger("Please provide your email address");
                    return Redirect("~/admin/user/edit/" + username);
                }

                if (!string.IsNullOrEmpty(email) && !Util.IsValidEmail(email))
                {
                    this.FlashDanger("Please provide a valid email address");
                    return Redirect("~/admin/user/edit/" + username);
                }

                //if (!ModelState.IsValid)
                //{
                //    this.FlashDanger("Please fix the errors below before resubmitting the form");
                //    return View("Edit",data);
                //}


                //if (Roles.IsUserInRole("Administrator"))
                //{
                //    user.role = role;
                //}
                //else
                //{
                //    user.role = Roles.GetRolesForUser(username).FirstOrDefault();
                //}

                if (ModelState.IsValid)
                {
                    dynamic user = new System.Dynamic.ExpandoObject();

                    user.username = username;
                    user.firstname = firstname;
                    user.lastname = lastname;
                    user.nickname = nickname;
                    user.email = email;
                    user.url = website;
                    user.description = description;
                    user.password = password;
                    user.role = role;

                    UserModel.UpdateUser(user, username, role);
                    this.FlashSuccess("Updated sucess");

                    if (!string.IsNullOrEmpty(password_old))
                    {
                        string mess = UserModel.UpdatePassword(usr.UserID, password);
                        this.FlashSuccess(mess);
                    }
 
                    return Redirect("~/admin/user/edit/" + username);
                }
            }
            ViewBag.Roles = RoleModel.GetAllRoles();
            return View("Edit", usr);
        }

        public ActionResult Create()
        {
            var username = Request["username"];

            var email = Request["email"];

            var firstname = Request["firstname"];

            var lastname = Request["lastname"];

            var website = Request["website"];


            var password = Request["password"];
            var password2 = Request["password2"];

            var role = Request["role"];

            if (string.IsNullOrEmpty(username))
            {
                ModelState.AddModelError("username", "Chưa nhập username");
            }

            if (string.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("password", "Mật khẩu không để trống");
            }

            if (string.IsNullOrEmpty(password2))
            {
                ModelState.AddModelError("password2", "Chưa nhập mật khẩu lần 2");
            }

            if (password != password2 && password != null && password2 != null)
            {
                ModelState.AddModelError("password", "Mật khẩu không khớp");
            }

            if (string.IsNullOrEmpty(role))
            {
                ModelState.AddModelError("role", "Chưa chọn quyền cho user");
            }

            if (string.IsNullOrEmpty(email))
            {
                ModelState.AddModelError("Email", "Cần nhập email của user");
            }

            if (!string.IsNullOrEmpty(email))
            {
                if (!Util.IsValidEmail(email))
                {
                    ModelState.AddModelError("Email", "Email chưa đúng định dạng");
                }
            }

            var checkUserName = db.Users.Where(u => u.UserName == username).FirstOrDefault();
            if (checkUserName != null)
            {                
                ModelState.AddModelError("username", "Tên tài khoản này đã có, hãy chọn một tên khác.!");
            }

            var checkEmail = db.Users.Where(e => e.Email == email).FirstOrDefault();
            if (checkEmail != null)
            {                
                ModelState.AddModelError("email", "Email này dã có, hãy chọn một email khác");
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var hostUrl = Request.Url.GetComponents(UriComponents.SchemeAndServer, UriFormat.Unescaped);

                    var message = UserModel.Create(username, password, firstname, lastname, email, website, role, hostUrl);
                    this.FlashSuccess(message);
                    return Redirect("~/admin/user/edit/" + username);                    
                }
                catch (MembershipCreateUserException ex)
                {
                    if (ex.StatusCode == MembershipCreateStatus.DuplicateUserName)
                    {
                        this.FlashDanger("That user name is already in use. Please choose another.");
                    }
                    else
                    {
                        this.FlashWarning("Something went wrong. Please try again");
                    }
                }
            }

            return View("Index");
        }
    }
}