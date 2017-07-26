using System.Web.Mvc;

namespace News.Areas.Admin.Controllers
{
    public class DefaultController : BaseController
    {
        // GET: Admin/Default
        public ActionResult Index()
        {            
            return View();
        }

        public ActionResult ClearCache()
        {
            HttpContext.Response.Cache.SetNoStore();
            HttpContext.Response.Cache.SetNoServerCaching();
            return RedirectToAction("Index");
        }

    }
}