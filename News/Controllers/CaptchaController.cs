using News.Areas.Admin.Controllers.Components;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace News.Controllers
{
    public class CaptchaController : Controller
    {
        // GET: Captcha
        public void Index()
        {
            //string prefix = null;
            bool noisy = false;
            var rand = new Random((int)DateTime.Now.Ticks);
            var word = "ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz";

            //generate new question    

            string result = rand.Next(1000, 9999).ToString();

            int resultPosition = rand.Next(0, result.Length - 1);//rand vi tri ky tu xuat hien

            string display = string.Empty;

            for (int i = 0; i < result.Length; i++)
            {
                if (i != resultPosition)
                {
                    display += result[i];
                }
                else
                {
                    display += word[rand.Next(0, word.Length - 1)];
                }
            }

            var captcha = string.Format("{0}", display);

            //store answer
            Session["captcha"] = display.ToLower();

            int wImage = 60;
            int hImage = 30;

            var mem = new MemoryStream();
            var bmp = new System.Drawing.Bitmap(wImage, hImage);
            using (var gfx = System.Drawing.Graphics.FromImage((System.Drawing.Image)bmp))
            {
                gfx.TextRenderingHint = System.Drawing.Text.TextRenderingHint.ClearTypeGridFit;
                gfx.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;
                gfx.FillRectangle(System.Drawing.Brushes.White, new System.Drawing.Rectangle(0, 0, bmp.Width, bmp.Height));

                //add noise
                if (noisy)
                {
                    int i, r, x, y;
                    var pen = new System.Drawing.Pen(System.Drawing.Color.Yellow);
                    for (i = 1; i < 10; i++)
                    {
                        pen.Color = System.Drawing.Color.FromArgb(
                        (rand.Next(0, 255)),
                        (rand.Next(0, 255)),
                        (rand.Next(0, 255)));

                        r = rand.Next(0, (wImage / 3));
                        x = rand.Next(0, wImage);
                        y = rand.Next(0, hImage);

                        gfx.DrawEllipse(pen, x - r, y - r, r, r);
                    }
                }

                //add question
                gfx.DrawString(captcha, new System.Drawing.Font("Tahoma", 15), System.Drawing.Brushes.Gray, 2, 3);

                //render as Jpeg
                bmp.Save(mem, System.Drawing.Imaging.ImageFormat.Jpeg);

                //image stream
                var img = new WebImage(mem.GetBuffer());
                img.Write();

            }
        }
    }
}