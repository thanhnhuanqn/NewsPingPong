using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;

namespace News.Areas.Admin.Models
{
    public class MediaModel : DBContext
    {
        public static void UploadMedia(dynamic numFiles)
        {
            WebImage originalImage = null;
            //WebImage thumbnailImage = null;
            //WebImage mediumImage = null;
            //WebImage largeImage = null;
            var imageFileName = "";

            using (var db = newContext)
            {
                for (int i = 0; i < numFiles.Count; i++)
                {
                    var file = numFiles[i];
                    if (file.ContentLength > 0)
                    {
                        originalImage = new WebImage(file.InputStream);
                        imageFileName = Util.UrlFriendly(Guid.NewGuid().ToString() + "_" + Path.GetFileNameWithoutExtension(file.FileName).Trim());
                        originalImage.Save(@"~\uploads\" + imageFileName);

                        var path = imageFileName + Path.GetExtension(originalImage.FileName).Trim();
                        var fileTitle = Path.GetFileNameWithoutExtension(file.FileName).Trim();

                        var image = new Posts();                        
                        image.Title = fileTitle;
                        image.Name = imageFileName;
                        image.Excerpt = "image";
                        image.Content = "Image upload";
                        image.Status = "inherit";
                        image.Type = "attachment";
                        image.Created = DateTime.Now;
                        image.Modified = DateTime.Now;
                        image.GUID = path;
                        image.CommentStatus = "Open";
                        image.CommentCount = 0;
                        image.Parent = 0;


                        using (var context = newContext)
                        {
                            context.Posts.Add(image);
                            context.SaveChanges();
                        }

                        //Thumbs
                        Util.createImage(width: OptionModel.ThumbnailW, height: OptionModel.ThumbnailH, file_name: path, folderSaveFile: @"~\uploads\thumb\");
                        Util.createImage(width: OptionModel.MediumW, height: OptionModel.MediumH, file_name: path, folderSaveFile: @"~\uploads\medium\");
                        Util.createImage(width: OptionModel.LargeW, height: OptionModel.LargeH, file_name: path, folderSaveFile: @"~\uploads\large\");
                    }
                }
            }

        }

    }
}