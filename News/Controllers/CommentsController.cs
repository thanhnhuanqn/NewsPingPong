using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace News.Controllers
{
    public class CommentsController : Controller
    {
        // GET: Comment
        public ActionResult Index()
        {            

            AntiForgery.Validate();

            if (string.IsNullOrEmpty(Request["author"]))
            {
                Response.Write("Nhập tên của bạn");
                ModelState.AddModelError("author", "Nhập tên của bạn");
            }
            if (string.IsNullOrEmpty(Request["email"]))
            {
                Response.Write("Email không được để trống");
                ModelState.AddModelError("email", "Email không được để trống");
            }

            if (!Util.IsValidEmail(Request["email"]))
            {
                Response.Write("Email không đúng định dạng. Vui lòng kiểm tra lại");
                ModelState.AddModelError("email", "Email không đúng định dạng. Vui lòng kiểm tra lại");
            }

            if (Request.Cookies["comment_date"] != null)
            {
                var from = Convert.ToDateTime(Request.Cookies["comment_date"].Value);

                var to = DateTime.Now;

                var result = to - from;

                if (result.TotalSeconds <= 30)
                {
                    Response.Write("Bạn viết quá nhiều bình luận trong vài giây vừa qua!");
                    ModelState.AddModelError("","Bạn viết quá nhiều bình luận trong vài giây vừa qua!");
                }
            }



            if (string.IsNullOrEmpty(Request["comment"]))
            {
                Response.Write("Hãy ghi nội dung comment");                
            }


            int comment_post_ID = int.Parse(Request["comment_post_ID"]);

            Posts post = PostModel.Get(comment_post_ID);

            if (post == null)
            {
                Response.Write("Post not found");                
            }

            Comments comment = new Comments();
            //var status = post.post_status;

            comment.AuthorName = Request["author"];
            comment.AuthorEmail = Request["email"];
            comment.AuthorUrl = Request["url"];
            comment.CommentContent = Request["comment"];

            //dynamic user;

            //if (WebSecurity.CurrentUserId != -1)
            //{
            //    user = UserModel.Get(WebSecurity.CurrentUserId);

            //    comment.AuthorName = user.user_login;
            //    comment.AuthorEmail = user.user_email;
            //    comment.AuthorUrl = user.user_url;
            //    comment.UserID = WebSecurity.CurrentUserId;
            //    Response.Cookies["comment_date"].Value = DateTime.Now.ToString();
            //}
            //else
            {
                //xử lý nếu thiết lập user cần đăng ký mới được comment
                //OptionRepository.GetOption();
                Response.Cookies["author"].Value = comment.AuthorName;
                Response.Cookies["author_email"].Value = comment.AuthorEmail;
                Response.Cookies["author_url"].Value = comment.AuthorUrl;
                Response.Cookies["user_id"].Value = "0";
                Response.Cookies["comment_date"].Value = DateTime.Now.ToString();
            }
            
            comment.CommentType = "post";
            comment.AuthorIP = Request.Url.Host;
            comment.Agent = Request.UserAgent;
            comment.DateCreated = DateTime.Now;
            comment.Approved = "1";


            comment.CommentParent = int.Parse(Request["comment_parent"]);
            comment.PostID = post.PostID;

            CommentModel.Create(comment);

            return  Redirect(Request.UrlReferrer.OriginalString);            
        }
    }
}