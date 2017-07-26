using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Controllers
{

    public class CateController : Controller
    {
        [OutputCache(Duration = int.MaxValue, VaryByParam = "slug")]
        // GET: Cate
        public ActionResult Index(string slug)
        {
            ViewBag.Slug = slug;
            return View();
        }
    }
}