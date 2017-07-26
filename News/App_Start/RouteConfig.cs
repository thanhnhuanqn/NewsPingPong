using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace News
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               name: "XuHuong",
               url: "xuhuong/{slug}",
               defaults: new { controller = "Home", action = "Tag", slug = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Blog",
                url: "blog/{slug}",
                defaults: new { controller = "Home", action = "Blog", slug = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "p",
                url: "p/{slug}",
                defaults: new { controller = "Home", action = "Page", slug = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Category",
                url: "c/{slug}",
                defaults: new { controller = "Home", action = "Category", slug = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Thumbnail",
                url: "Thumbnail/{id}",
                defaults: new { controller = "Thumbnail", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
