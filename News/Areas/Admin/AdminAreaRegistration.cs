using System.Web.Mvc;

namespace News.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {

            context.MapRoute(
               "Admin",
               "Admin/",
               new { controller = "default", action = "Index" }               
           );

            context.MapRoute(
                "Admin_default_Term",
                "Admin/{controller}/{action}/{slug}",
                new { action = "Edit", slug = UrlParameter.Optional }
            );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}