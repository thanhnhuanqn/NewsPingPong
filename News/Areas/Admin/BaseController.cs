using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;
using News.Areas.Admin.Models;

namespace News.Areas.Admin
{
    public class BaseController : Controller
    {
        
        //"Administrator", "Author", "Contributor","Editor", "Subscriber"

        internal readonly string Administrator = "Administrator";
        internal readonly string Author = "Author";
        internal readonly string Contributor = "Contributor";
        internal readonly string Editor = "Editor";
        internal readonly string Subscriber = "Subscriber";

        public BaseController()
            : base()
        {
            if (!SecurityModel.RequireRole(Administrator))
            {
                Logout();
            }
        }

        public ActionResult Logout()
        {
            SecurityModel.Logout();
            SecurityModel.RequireAuthenticatedUser();
            this.FlashDanger("You don't permission this area");
            return RedirectToAction("Login", "Account");
        }
    }
}