using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Santhos.Web.Mvc.BootstrapFlashMessages;

namespace News.Areas.Admin.Controllers
{
    public class MediaController : BaseController
    {
        // GET: Admin/Media
        public ActionResult Index()
        {
            try
            {
                var files = Request.Files;
                if (files != null)
                {
                    MediaModel.UploadMedia(files);
                }

                var listItem = Request["actionDelete"];

                if (listItem != null)
                {
                    Util.DeleteListImage(listItem);
                }                

            } catch(Exception ex)
            {
                this.FlashDanger(ex.Message);
            }
            return View();
        }


        [HttpPost]
        public void Upload()
        {

        }
    }
}