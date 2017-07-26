using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.IO;
using System.Linq;
using System.Web.Helpers;
using System.Web.Mvc;

namespace News.Controllers
{
    public class ThumbnailController : Controller
    {        
        // GET: Thumbnail
        public void Index(dynamic id)
        {
            var postid = 0;
            bool flag = int.TryParse(id, out postid);

            if (flag)
            {
                dynamic post_image_id = PostMetaModel.GetMetaKey(postid, "_thumbnail_id");

                if (post_image_id != null)
                {
                    Posts get_photo = PostModel.Get(int.Parse(post_image_id));

                    var size = Request["size"] ?? "";

                    var tmp = size.Split('x').ToList();

                    var Width = 0;
                    var Height = 0;
                    try
                    {
                        Width = Math.Abs(Convert.ToInt32(tmp.ElementAt(0)));
                        Height = Math.Abs(Convert.ToInt32(tmp.ElementAt(1)));

                        if (Width > 4000)
                        {
                            Width = 1024;
                        }
                        if (Height > 4000)
                        {
                            Height = 1024;
                        }

                    }
                    catch
                    {

                    }
                    string fileName = get_photo.GUID;
                    string folder = "~/tmp/";

                    var location = Server.MapPath(folder);
                    string fileSave = Width.ToString() + "x" + Height.ToString() + "_" + fileName;
                    var path = Path.Combine(location, fileSave);

                    FileInfo f = new FileInfo(path);
                    if (!f.Exists)
                    {
                        _createImage(Width, Height, fileName, "~/tmp");
                    }
                    else
                    {
                        WebImage image = new WebImage(path);
                        image.Write();
                    }
                    f = new FileInfo(path);
                    if (f.Exists)
                    {
                        WebImage image = new WebImage(path);
                        image.Write();
                    }
                }
            }

        }

        private void _createImage(int width, int height, string file_name, string folderSaveFile)
        {

            var Width = 0;
            var Height = 0;
            try
            {
                Width = Convert.ToInt32(width);
                Height = Convert.ToInt32(height);
            }
            catch
            {
                return;
            }
            string fileName = file_name;
            string folder = "~/Uploads/";

            var location = HttpContext.Server.MapPath(folder);

            var path = Path.Combine(location, fileName);

            FileInfo f = new FileInfo(path);
            if (!f.Exists)
            {
                return;
            }
            System.Drawing.Image image = System.Drawing.Image.FromFile(path);

            System.Drawing.Image finalImage = image;

            System.Drawing.Bitmap bitmap = null;

            try
            {
                int left = 0;
                int top = 0;
                int srcWidth = Width;
                int srcHeight = Height;

                bitmap = new System.Drawing.Bitmap(Width, Height);

                double croppedHeightToWidth = (double)Height / Width;

                double croppedWidthToHeight = (double)Width / Height;

                if (image.Width > image.Height)
                {
                    srcWidth = (int)(Math.Round(image.Height * croppedWidthToHeight));
                    if (srcWidth < image.Width)
                    {
                        srcHeight = image.Height;
                        left = (image.Width - srcWidth) / 2;
                    }
                    else
                    {
                        srcHeight = (int)Math.Round(image.Height * ((double)image.Width / srcWidth));
                        srcWidth = image.Width;
                        top = (image.Height - srcHeight) / 2;
                    }
                }
                else
                {
                    srcHeight = (int)(Math.Round(image.Width * croppedHeightToWidth));
                    if (srcHeight < image.Height)
                    {
                        srcWidth = image.Width;
                        top = (image.Height - srcHeight) / 2;
                    }
                    else
                    {
                        srcWidth = (int)Math.Round(image.Width * ((double)image.Height / srcHeight));
                        srcHeight = image.Height;
                        left = (image.Width - srcWidth) / 2;
                    }
                }

                using (System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap))
                {
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                    g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                    g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    g.DrawImage(image, new System.Drawing.Rectangle(0, 0, bitmap.Width, bitmap.Height), new System.Drawing.Rectangle(left, top, srcWidth, srcHeight), System.Drawing.GraphicsUnit.Pixel);
                }

                finalImage = bitmap;
            }
            catch
            {
                return;
            }

            string fileSave = Width.ToString() + "x" + Height.ToString() + "_" + fileName;

            var folder_Save = HttpContext.Server.MapPath(folderSaveFile);
            var path_final = Path.Combine(folder_Save, fileSave);

            MemoryStream ms = new MemoryStream();
            finalImage.Save(ms, image.RawFormat);
            var img = new WebImage(ms.GetBuffer());
            img.Resize(Width, Height);
            img.Save(path_final, img.ImageFormat);

        }


    }
}