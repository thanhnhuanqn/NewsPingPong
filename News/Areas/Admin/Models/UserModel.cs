using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using News.Services;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Helpers;


namespace News.Areas.Admin.Models
{
    public class UserModel : DBContext
    {        

        public static Users Get(decimal id)
        {
            using (var context = newContext)
            {
                return context.Users.Find(id);
            }
        }

        public static Users Get(string username)
        {
            using (var context = newContext)
            {
                return context.Users.Where(u => u.UserName == username).FirstOrDefault();
            }
        }

        public static string GetUserNameById(int idAuthor)
        {
            Users user = Get(idAuthor);

            if (user != null)
            {
                return user.UserName;
            }
            return string.Empty;
        }


        public static IEnumerable<Users> GetAll(string orderBy = null, string where = null)
        {
            using (var context = newContext)
            {
                return context.Users.OrderByDescending(u => u.UserID).ToList();
            }

        }

        public static void Remove(string username)
        {
            using (var context = newContext)
            {
                var user = context.Users.Where(u => u.UserName == username).FirstOrDefault();

                if (user != null && username != "admin")
                {
                    DeleteMetaUser(username);
                    DeleteUser(username);
                }
            }
        }

        public static void DeleteUser(string username)
        {
            using (var context = newContext)
            {
                var user = context.Users.Where(u => u.UserName == username).FirstOrDefault();
                if (user != null)
                {
                    context.Users.Remove(user);
                    context.SaveChanges();
                }
            }
        }

        public static Users FindByEmail(string email)
        {
            using (var context = newContext)
            {
                return context.Users.Where(u => u.Email == email).FirstOrDefault();
            }
        }


        public static string Create(string username, string password, string firstname, string lastname, string email, string website, string role, string hostUrl)
        {
            var roleName = RoleModel.Get(role);

            if (role != null)
            {
                var token = Crypto.GenerateSalt();

                var user = new Users();

                user.UserName = username;
                user.Email = email;
                user.UserPassword = Crypto.HashPassword(password + token);
                user.ActivationKey = token;
                user.Url = website;
                user.Registered = DateTime.Now;
                user.UserStatus = true;
                user.RoleID = roleName.RoleID;

                using (var context = newContext)
                {
                    context.Users.Add(user);
                    context.SaveChanges();
                }

                //Add info to usermeta: nickname, first_name, last_name, description
                InsertMetaUser(username, string.Empty, firstname, lastname, string.Empty);

                var queryString = HttpUtility.UrlEncode(token);

                var confirm = "~/account/confirm?confirmationCode=";

                var confirmationUrl = hostUrl + VirtualPathUtility.ToAbsolute(confirm + queryString);

                var message = "<p>Your confirmation code is: " + token + "</p>" +
                    "<p>Visit <a href=\"" + confirmationUrl + "\">" + confirmationUrl + "</a>" + " to activate your account.</p>";

                var subject = "Email to send from gepapixel.com";

                return Util.SendEmail("thanhnhuan@gmail.com", email, subject, message);
            }
            return "Roles not found";
        }

        public static void InsertMetaUser(string username, string nickname, string firstname, string lastname, string description)
        {
            var userData = Get(username);
            if (userData != null)
            {
                addMetaUser((int)userData.UserID, "nickname", nickname);
                addMetaUser((int)userData.UserID, "firstname", firstname);
                addMetaUser((int)userData.UserID, "lastname", lastname);
                addMetaUser((int)userData.UserID, "description", description);

            }
        }

        private static IEnumerable<UserMeta> _getMetaUser(string username)
        {
            using (var context = newContext)
            {
                var user = context.Users.Include("UserMeta").Where(u => u.UserName == username).FirstOrDefault();

                if (user != null)
                {
                    return user.UserMeta;
                }
                return null;
            }

        }

        public static dynamic GetUserMeta(string username)
        {
            var result = _getMetaUser(username).ToArray();

            dynamic user = new ExpandoObject();

            foreach (UserMeta item in result)
            {
                if (item.UMetaKey == "nickname") user.nickname = item.UMetaValue;
                if (item.UMetaKey == "firstname") user.first_name = item.UMetaValue;
                if (item.UMetaKey == "lastname") user.last_name = item.UMetaValue;
                if (item.UMetaKey == "description") user.description = item.UMetaValue;
            }

            return user;

        }


        private static void addMetaUser(int user_id, string meta_key, string meta_value)
        {
            var user = Get(user_id);
            if (user != null)
            {
                using (var context = newContext)
                {
                    var UserMeta = new UserMeta();

                    UserMeta.UserID = user.UserID;
                    UserMeta.UMetaKey = meta_key;
                    UserMeta.UMetaValue = meta_value;
                    context.UserMeta.Add(UserMeta);
                    context.SaveChanges();
                }
            }
        }

        private static void addMetaUser(int user_id, string meta_key, string meta_value, int updateUserId = -1)
        {
            using (var context = newContext)
            {
                if (updateUserId < 0)
                {
                    addMetaUser(user_id, meta_key, meta_value);
                }
                else
                {
                    var usermeta = context.UserMeta.Where(u => u.UMetaKey == meta_key && u.UserID == updateUserId).FirstOrDefault();

                    if (usermeta != null)
                    {
                        usermeta.UMetaValue = meta_value;
                        context.Entry(usermeta).State = EntityState.Modified;
                        context.SaveChanges();

                    }
                }
            }
        }

        public static void DeleteMetaUser(string username)
        {

            using (var context = newContext)
            {
                var user = context.Users.Include("UserMeta").Where(u => u.UserName == username).FirstOrDefault();
                if (user != null)
                {
                    user.UserMeta.Clear();
                    context.SaveChanges();
                }
            }

        }
        public static string UpdatePassword(long UserID, string password)
        {
            try
            {
                using (var context = newContext)
                {
                    var userExists = Get(UserID);

                    var token = Crypto.GenerateSalt();

                    userExists.UserPassword = Crypto.HashPassword(password + token);

                    userExists.ActivationKey = token;

                    context.Entry(userExists).State = EntityState.Modified;
                    context.SaveChanges();
                    return "Password updated";
                }
            } catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public static void UpdateUser(dynamic user, string username, string roleName)
        {
            using (var context = newContext)
            {
                var userExists = Get(username);
                var role = RoleModel.Get(roleName);

                if (userExists != null && role != null)
                {
                    try
                    {
                        DeleteMetaUser((string)userExists.UserName);
                        userExists.Email = user.email;
                        userExists.Url = user.url;
                        if (userExists.UserName != "admin")
                        {
                            userExists.RoleID = role.RoleID;
                        }                        

                        context.Entry(userExists).State = EntityState.Modified;
                        context.SaveChanges();

                    }
                    catch (Exception ex)
                    {
                        Console.Write(ex);
                    }
                    InsertMetaUser((string)user.username, user.nickname, user.firstname, user.lastname, user.description);
                }
            }
        }
        public static string GetUserMeta(Users user, string key)
        {
            using (var context = newContext)
            {
                var meta = context.UserMeta.Where(u => u.UserID == user.UserID);

                if (meta != null)
                {
                    var data = meta.Where(m => m.UMetaKey.StartsWith(key)).FirstOrDefault();

                    if (data != null) return data.UMetaValue;
                }
            }
            return string.Empty;
        }

        public static string GetUserMetaKey(int UserID, string key)
        {

            using (var context = newContext)
            {
                var user = context.Users.Find(UserID);
                if (user != null)
                {
                    var meta = user.UserMeta;

                    if (meta != null)
                    {
                        var data = meta.Where(m => m.UMetaKey.StartsWith(key)).FirstOrDefault();

                        if (data != null) return data.UMetaValue;

                    }
                }
                return string.Empty;
            }
        }
    }
}