using News.Areas.Admin.Models;
using News.Data;
using System.Linq;
using System.Web.Mvc;

namespace News.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var search = Server.HtmlEncode(Request.Unvalidated["search"]);

            if (!string.IsNullOrEmpty(search))
            {
                using (var db = new NewsEntities())
                {
                    dynamic posts = db.view_GetAllPostPublish.Where(p => p.Title.ToLower().Trim().Contains(search.ToLower().Trim())).OrderByDescending(p=>p.PostID).ToList();

                    return View("search", posts);
                }
                
            }
            return View();
        }

        [OutputCache(Duration = int.MaxValue, VaryByParam = "slug")]
        public ActionResult Page(string slug)
        {
            using (var db = new NewsEntities())
            {
                var post = db.Posts.Where(p => p.Name == slug).FirstOrDefault();
                if (post != null)
                {
                    return View(post);
                }
                return View();
            }
        }
        [OutputCache(Duration = int.MaxValue, VaryByParam = "slug")]
        public ActionResult Blog(string slug)
        {

            using (var db = new NewsEntities())
            {
                var post = db.Posts.Where(p => p.Name == slug).FirstOrDefault();
                if (post != null)
                {
                    var count = PostMetaModel.GetMetaKey(post.PostID, "CountView");
                    if (count != null)
                    {
                        var CountNew = int.Parse(count) + 1;
                        PostMetaModel.CreateKeyValue(post.PostID, "CountView", CountNew.ToString());
                    } else
                    {
                        PostMetaModel.CreateKeyValue(post.PostID, "CountView", "1");
                    }
                }
                ViewBag.Post = post;
                return View();
            }
        }
        [OutputCache(Duration = int.MaxValue, VaryByParam = "slug")]
        public ActionResult Tag(string slug)
        {
            ViewBag.Slug = slug;
            return View();
        }

        [OutputCache(Duration = int.MaxValue, VaryByParam = "slug")]
        // GET: Cate
        public ActionResult Category(string slug)
        {
            ViewBag.Slug = slug;
            return View();
        }
    }
}