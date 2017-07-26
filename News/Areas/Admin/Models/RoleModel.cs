using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class RoleModel : DBContext
    {
        private static NewsEntities db = new NewsEntities();


        public static Roles Get(string role)
        {
            using (var context = newContext)
            {                
                return newContext.Roles.Where(r => r.RoleName == role).FirstOrDefault(); 
            }
        }



        public static Roles Get(long roleID)
        {
            using (var context = newContext)
            {                
                return newContext.Roles.Find(roleID);
            }
        }

        public static IEnumerable<Roles> GetAllRoles()
        {
            using (var context = newContext)
            {
                var model = newContext.Roles.ToList();
                return model;
            }
        }

        public static string GetRolesForUser(string UserName)
        {
            var user = UserModel.Get(UserName);
            if (user != null)
            {
                using (var context = newContext)
                {
                    var role = context.Roles.Find(user.RoleID);
                    if (role != null)
                    {
                        return role.RoleName;
                    }
                }
            }
            return string.Empty;

        }


        /// <summary>
        /// Tạo Role để phân quyền theo role
        /// </summary>
        /// <param name="newrole">Tên role sẽ được tạo</param>
        /// <returns>Chuổi thông điệp tạo thành công hoặc lỗi rằng role đã tồn tại</returns>
        public static string CreateRole(string newrole)
        {
            if (!RoleExists(newrole))
            {
                using (var context = newContext)
                {
                    var role = new Roles();
                    role.RoleName = newrole;

                    context.Roles.Add(role);
                    context.SaveChanges();

                }
                return newrole + " added as Role";
            }
            else
            {
                return "That role already exists";
            }
        }

        private static bool RoleExists(string newrole)
        {
            using (var context = newContext)
            {
                var role = context.Roles.Where(r => r.RoleName == newrole).FirstOrDefault();
                if (role == null)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        public static void AddUserToRole(string role, string user)
        {
            using (var context = newContext)
            {
                var roleUser = context.Roles.Where(r => r.RoleName == role).FirstOrDefault();
                if (roleUser != null)
                {
                    var usr = context.Users.Where(u => u.UserName == user).FirstOrDefault();
                    if (usr != null)
                    {
                        usr.RoleID = roleUser.RoleID;
                        context.Entry(usr).State = EntityState.Modified;
                        context.SaveChanges();
                    }
                }
            }
        }

        public static bool IsUserInRole(string username, string roleName)
        {
            using (var context = newContext)
            {
                var user = db.Users.Where(t => t.UserName == username).FirstOrDefault();
                var role = db.Roles.Where(r => r.RoleName == roleName).FirstOrDefault();
                if (user != null && role != null)
                {
                    if (user.RoleID == role.RoleID) return true;
                }
                return false;
            }
        }

    }
}