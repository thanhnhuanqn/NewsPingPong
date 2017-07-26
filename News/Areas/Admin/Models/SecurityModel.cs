using News.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;

namespace News.Areas.Admin.Models
{
    public static class SecurityModel
    {

        public static int CurrentUserId { get { return _CurrentUserId; } }
        private static int _CurrentUserId { get; set; }

        public static string CurrentUserName { get { return _CurrentUserName; } }
        private static string _CurrentUserName { get; set; }

        public static string CurrentRole { get { return _CurrentRole; } }
        private static string _CurrentRole { get; set; }

        public static bool HasUserId
        {
            get
            {
                if (_CurrentUserId != -1)
                    return true;
                else
                    return false;
            }
        }

        public static bool IsAuthenticated { get { return _IsAuthenticated; } }
        private static bool _IsAuthenticated { get; set; }

        public static bool Login(string userName, string password, bool persistCookie = false)
        {
            var user = UserModel.Get(userName);
            var role = RoleModel.GetRolesForUser(user.UserName);

            var checkpass = Crypto.HashPassword(password + user.ActivationKey);
            var checkpassUser = user.UserPassword;

            if (user != null && role != null)
            {
                if (Crypto.VerifyHashedPassword(user.UserPassword, password + user.ActivationKey))
                {
                    HttpContext.Current.Response.Cookies["User.UserName"].Value = user.UserName;
                    HttpContext.Current.Response.Cookies["User.UserEmail"].Value = user.Email;
                    HttpContext.Current.Response.Cookies["User.UserRoleID"].Value = user.RoleID.ToString();
                    HttpContext.Current.Response.Cookies["User.UserRole"].Value = role.ToString();
                    HttpContext.Current.Response.Cookies["User.UserLoginDate"].Value = DateTime.Now.ToShortDateString();
                    _IsAuthenticated = true;
                    _CurrentUserName = user.UserName;
                    _CurrentUserId = (int)user.UserID;
                    _CurrentRole = role.ToString();
                    return true;
                }
            }
            return false;
        }

        public static void Logout()
        {
            //HttpContext.Current.Response.Cookies["User.UserName"].Value = string.Empty;
            //HttpContext.Current.Response.Cookies["User.UserEmail"].Value = string.Empty;
            //HttpContext.Current.Response.Cookies["User.UserRoleID"].Value = string.Empty;
            //HttpContext.Current.Response.Cookies["User.UserRole"].Value = string.Empty;

            HttpContext.Current.Response.Cookies.Clear();
            _IsAuthenticated = false;
            _CurrentUserName = "";
            _CurrentUserId = -1;
        }

        public static bool IsCurrentUser(string userName)
        {
            var user = UserModel.Get(userName);

            if (user != null)
            {
                if (_CurrentUserName == user.UserName)
                {
                    return true;
                }
            }

            return false;

        }

        public static bool IsCurrentUser(decimal userId)
        {
            var user = UserModel.Get(userId);

            if (user != null)
            {
                if (_CurrentUserName == user.UserName)
                {
                    return true;
                }
            }

            return false;

        }


        public static bool RequireRole(string role)
        {
            if (!string.IsNullOrEmpty(role) && !string.IsNullOrEmpty(_CurrentRole))
            {
                if (_CurrentRole.Equals(role))
                {
                    return true;
                }
            }
            return false;
        }

        public static void RequireAuthenticatedUser()
        {
            if (!_IsAuthenticated)
            {
                var ReturnUrl = HttpContext.Current.Request.Url;
                if (ReturnUrl != null)
                {
                    HttpContext.Current.Response.Redirect("~/Admin/Account/login?ReturnUrl=" + ReturnUrl);
                }
                else
                {
                    HttpContext.Current.Response.Redirect("~/Admin/Account/login");
                }

            }
        }
    }
}
