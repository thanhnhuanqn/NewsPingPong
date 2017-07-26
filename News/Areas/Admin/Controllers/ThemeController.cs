using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Areas.Admin.Controllers
{
    public class ThemeController : BaseController
    {
        // GET: Admin/Theme
        public ActionResult Index()
        {
            return View();
        }
    }
}