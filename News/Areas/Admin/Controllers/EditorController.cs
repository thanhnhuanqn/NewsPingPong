using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Areas.Admin.Controllers
{
    public class EditorController : BaseController
    {
        // GET: Admin/Editor
        public ActionResult Index()
        {
            return View();
        }
    }
}