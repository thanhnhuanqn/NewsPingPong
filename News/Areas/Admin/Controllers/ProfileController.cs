using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Areas.Admin.Controllers
{
    public class ProfileController : BaseController
    {
        NewsEntities db = new NewsEntities();

        // GET: Admin/Profile
        public ActionResult Index(string slug)
        {
            var user = db.Users.Include("UserMeta").Where(u=>u.UserName == slug).FirstOrDefault();
            return View(user);
        }
    }
}