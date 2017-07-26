using Microsoft.Web.Helpers;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;

namespace News.Areas.Admin.Controllers.Components
{
    public class Util
    {

        /// <summary>
        /// Loại bỏ các ký tự có đấu ra khỏi một post_name hay một term_name
        /// </summary>
        /// <param name="title">Chuổi cần định dạng lại</param>
        /// <returns>Một chuổi không chứa các ký tự có dấu</returns>
        private static string _removeUnicode(string title)
        {
            var a = new char[] { 'à', 'á', 'ạ', 'ả', 'ã', 'â', 'ầ', 'ấ', 'ậ', 'ẩ', 'ẫ', 'ă', 'ằ', 'ắ', 'ặ', 'ẳ', 'ẵ' };

            foreach (var item in a)
            {
                title = title.Replace(item, 'a');
            }
            //e
            var e = new char[] { 'è', 'é', 'ẹ', 'ẻ', 'ẽ', 'ê', 'ề', 'ế', 'ệ', 'ể', 'ễ' };
            foreach (var item in e)
            {
                title = title.Replace(item, 'e');
            }
            //o
            var o = new char[] { 'ò', 'ó', 'ọ', 'ỏ', 'õ', 'ô', 'ồ', 'ố', 'ộ', 'ổ', 'ỗ', 'ơ', 'ờ', 'ớ', 'ợ', 'ở', 'ỡ' };
            foreach (var item in o)
            {
                title = title.Replace(item, 'o');
            }
            //i
            var i = new char[] { 'ì', 'í', 'ị', 'ỉ', 'ĩ' };
            foreach (var item in i)
            {
                title = title.Replace(item, 'i');
            }
            //u
            var u = new char[] { 'ù', 'ú', 'ụ', 'ủ', 'ũ', 'ư', 'ừ', 'ứ', 'ự', 'ử', 'ữ' };
            foreach (var item in u)
            {
                title = title.Replace(item, 'u');
            }
            //y
            var y = new char[] { 'ỳ', 'ý', 'ỵ', 'ỷ', 'ỹ' };
            foreach (var item in y)
            {
                title = title.Replace(item, 'y');
            }
            //d
            title = title.Replace('đ', 'd');

            return title;
        }

        /// <summary>
        /// Tạo đường dẫn thân thiện 
        /// </summary>
        /// <param name="title">chuổi đường dẫn cần định dạng lại</param>
        /// <returns>Chuổi đã được định dạng</returns>
        public static string UrlFriendly(string title)
        {
            if (!string.IsNullOrEmpty(title))
            {
                // make it all lower case
                title = title.ToLower();

                //xoá bó các ký tự có đấu có trong chuổi - đường đẫn
                title = _removeUnicode(title);

                // remove entities
                title = Regex.Replace(title, @"&\w+;", "");

                // remove anything that is not letters, numbers, dash, or space
                title = Regex.Replace(title, @"[^a-z0-9\-\s]", "");

                // replace spaces
                title = title.Replace(' ', '-');

                // collapse dashes
                title = Regex.Replace(title, @"-{2,}", "-");

                // trim excessive dashes at the beginning
                title = title.TrimStart(new[] { '-' });

                // if it's too long, clip it
                if (title.Length > 160)
                    title = title.Substring(0, 159);

                // remove trailing dashes
                title = title.TrimEnd(new[] { '-' });
            }

            return title;

        }

        public delegate bool CheckPostNameMethod(int id, string post_name);

        /// <summary>
        /// Hàm kiểm tra xem một post_name (term_name hoặc post_name) có tồn tại hay chưa
        /// có 2 trường hợp chính
        /// 1. Nếu là chuổi không có số thì xử lý tăng số phiên bản để tạo slug mới
        /// ví dụ như trang-chu nếu trùng thì tạo là trang-chu-1
        /// 2. Nếu đã có trang-chu-1 thì tăng thêm số phiên bảng thành 2: trang-chu-2
        /// 
        /// </summary>
        /// <param name="post_name">friendlyname cần xử lý</param>
        /// <param name="id">Id để loại bỏ chính nó ra khỏi danh sách tìm kiếm.
        /// Số âm dùng trong trường hợp là tạo mới</param>
        /// <returns>Một chuổi được định dạng theo tiêu chuẩn url_friendly</returns>
        public static string CreatePostNameFriendly(string post_name, CheckPostNameMethod MethodOfType, int id = -1)
        {
            post_name = UrlFriendly(post_name);

            bool flag = false;
            //nếu chưa có trong csdl thì trả về ngay.
            if (false == MethodOfType(id, post_name)) return post_name;

            string[] postNameArray = post_name.Split('-');
            string joinToPostName = string.Empty;
            int j;

            //tách lấy số phiên bản - mảng post_name có chỉ số cuối cùng
            bool flagId = Int32.TryParse(postNameArray[postNameArray.Length - 1], out j);

            //Nếu tách thành công tức là post_name dạng: trang-chu-[n]; n=1,2,3,...
            if (true == flagId)
            {
                joinToPostName = String.Join("-", postNameArray, 0, postNameArray.Length - 1);
            }
            else
            {
                joinToPostName = post_name;
            }

            //Giới hạn 999 phiên bản - có thể dùng đệ qui để bỏ giới hạn.
            for (int i = 1; i < 1000; i++)
            {
                flag = MethodOfType(id, joinToPostName + "-" + i);

                //Nếu không tồn lại post_name này trong csdl
                if (false == flag)
                {
                    return joinToPostName + "-" + i;
                }
                else
                    continue;
            }

            return post_name;
        }

        /// <summary>
        /// Hiển thị các page theo cha-con nếu có.(thêm gạch nối cho các tiêu đề nếu là con)
        /// </summary>
        /// <returns>Danh sách các page đã được chỉnh sửa</returns>

        public static IEnumerable<dynamic> FormatDataForGird(IEnumerable<Posts> pages, IEnumerable<Posts> pagesChild)
        {                        

            List<dynamic> listFormat = new List<dynamic>();

            foreach (dynamic page in pages)
            {
                if (page.Parent == 0)
                {
                    listFormat.Add(page);
                    FormatDataForGirdSub(listFormat, pagesChild, (int)page.PostID, 1);
                }
            }

            return listFormat;
        }

        public static void FormatDataForGirdSub(List<dynamic> listFormat, IEnumerable<dynamic> pagesChild, dynamic idPageParent, int level = 1)
        {
            string rowPerfix = string.Empty;

            foreach (dynamic page in pagesChild)
            {
                if (idPageParent == page.Parent)
                {
                    for (int i = 0; i < level; i++)
                    {
                        rowPerfix += "— ";
                    }

                    dynamic newobject = CopyPageObject(page);

                    newobject.Title = rowPerfix + page.Title;

                    listFormat.Add(newobject);

                    level++;
                    FormatDataForGirdSub(listFormat, pagesChild, (int)page.PostID, level);
                    level = level - 1;
                    rowPerfix = string.Empty;
                }
            }
        }

        public static dynamic CopyPageObject(dynamic page)
        {
            dynamic obj = new ExpandoObject();

            obj.PostID = page.PostID;
            obj.Title = page.Title;
            obj.Content = page.Content;
            obj.Excerpt = page.Excerpt;
            obj.Name = page.Name;
            obj.Parent = page.Parent;
            obj.UserID = page.UserID;
            obj.Created = page.Created;
            obj.Modified = page.Modified;
            obj.Status = page.Status;

            return obj;
        }

        public static string SendEmail(string from, string to, string subject, string body)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(to);
                mailMessage.Subject = subject;

                mailMessage.From = new MailAddress(from);
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = body;
                
                SmtpClient smptClient = new SmtpClient();
                smptClient.Host = OptionModel.MailServerUrl;
                smptClient.Port = OptionModel.MailServerPort;
                smptClient.Credentials = new NetworkCredential(OptionModel.MailServerLogin, OptionModel.MailServerPass);
                smptClient.EnableSsl = true;
                smptClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smptClient.UseDefaultCredentials = false;

                smptClient.Send(mailMessage);
                return "Send mail success";
            }
            catch ( Exception ex)
            {
                return ex.Message;
            }

        }

        public static void createImage(int width, int height, string file_name, string folderSaveFile)
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

            var location = HttpContext.Current.Server.MapPath(folder);
            var path = Path.Combine(location, fileName);
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

            var folder_Save = HttpContext.Current.Server.MapPath(folderSaveFile);
            var path_final = Path.Combine(folder_Save, file_name);

            MemoryStream ms = new MemoryStream();
            finalImage.Save(ms, image.RawFormat);
            var img = new WebImage(ms.GetBuffer());
            img.Resize(Width, Height);
            img.Save(path_final, img.ImageFormat);

        }

        public static Dictionary<dynamic, dynamic> CopyRequestFormToDictionary(NameValueCollection Form)
        {
            Dictionary<dynamic, dynamic> Dictionary = new Dictionary<dynamic, dynamic>();

            foreach (var key in Form.AllKeys)
            {
                Dictionary.Add(key, Form[key]);
            }

            return Dictionary;
        }

        public static DateTime SetupDateTime(int year, int month, int day, int hour, int minutes)
        {
            if (day > DateTime.DaysInMonth(year, month) || day < 0)
            {
                day = DateTime.DaysInMonth(year, month);
            }

            if (minutes > 59 || minutes < 0)
            {
                minutes = 0;
            }

            if (hour > 23 || hour < 0)
            {
                hour = 0;
            }

            return new DateTime(year, month, day, hour, minutes, 0, 0);

        }


        public static bool IsEqualTo<T>(T value, T comparator) where T : IComparable
        {
            return value.Equals(comparator);
        }

        public static bool IsGreaterThan<T>(T value, T comparator) where T : IComparable
        {
            return value.CompareTo(comparator) > 0;
        }

        public static bool IsLessThan<T>(T value, T comparator) where T : IComparable
        {
            return value.CompareTo(comparator) < 0;
        }

        public static bool IsGreaterThanOrEqualTo<T>(T value, T comparator) where T : IComparable
        {
            return value.CompareTo(comparator) >= 0;
        }

        public static bool IsLessThanOrEqualTo<T>(T value, T comparator) where T : IComparable
        {
            return value.CompareTo(comparator) <= 0;
        }

        public static bool IsBetween<T>(T value, T minValue, T maxValue) where T : IComparable
        {
            return (value.CompareTo(minValue) >= 0 && value.CompareTo(maxValue) <= 0);
        }

        public static bool IsNumbersOnly(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                string expression = @"^[0-9]+$";
                return System.Text.RegularExpressions.Regex.IsMatch(value, expression);
            }
            return false;
        }

        public static bool IsLettersOnly(string value)
        {
            string expression = @"^[A-Za-z]+$";
            return System.Text.RegularExpressions.Regex.IsMatch(value, expression);
        }

        public static bool IsAlphaNumeric(string value)
        {
            string expression = @"^[A-Za-z0-9]+$";
            return System.Text.RegularExpressions.Regex.IsMatch(value, expression);
        }

        public static bool IsValidEmail(string value)
        {
            string expression = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
            @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
            @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            return System.Text.RegularExpressions.Regex.IsMatch(value, expression);
        }

        public static bool IsValidEmail_(string s)
        {
            string pattern = @"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
            return Regex.IsMatch(s, pattern);
        }

        public static string CleanNames(string name)
        {
            name = name.Replace(".cshtml", "");
            return name;
        }



        /// <summary>
        /// Cắt - xén hình thành đã có thành một hình mới với toạ độ và kích thước được chỉ định
        /// Không resize hình ảnh.
        /// </summary>
        /// <param name="Img">Hình ảnh gốc</param>
        /// <param name="Width">Chiều rộng ảnh mới</param>
        /// <param name="Height">Chiều cao ảnh mới</param>
        /// <param name="X">Điểm x - Toạ độ ngang bắt đầu cắt trên ảnh gốc</param>
        /// <param name="Y">Điểm y - Toạ độ dọc được chọn để cắt trên ảnh gốc</param>
        /// <returns>trả về hình ảnh được cắt dưới dạng một mảng các bytes.</returns>
        public static dynamic Crop(string Img, int Width, int Height, int X, int Y)
        {
            try
            {
                using (Image OriginalImage = Image.FromFile(Img))
                {
                    using (Bitmap bmp = new Bitmap(Width, Height))
                    {
                        bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution);

                        using (Graphics Graphic = Graphics.FromImage(bmp))
                        {
                            Graphic.SmoothingMode = SmoothingMode.AntiAlias;
                            Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                            Graphic.DrawImage(OriginalImage, new Rectangle(0, 0, Width, Height), X, Y, Width, Height, GraphicsUnit.Pixel);
                            MemoryStream ms = new MemoryStream();
                            bmp.Save(ms, OriginalImage.RawFormat);
                            return ms.GetBuffer();
                        }
                    }
                }
            }
            catch (Exception Ex)
            {
                throw (Ex);
            }
        }


        /// <summary>
        /// Xoá một file bất kỳ bằng cách chỉ định tên file và đường dẫn tương đối đối của file
        /// </summary>
        /// <param name="file">file cần xoá</param>
        /// <param name="folder">đường dẫn tương đối đến file</param>
        public static void DeleteFile(string file, string folder)
        {
            var location = HttpContext.Current.Server.MapPath(folder);
            var fileName = file;
            var path = Path.Combine(location, fileName);
            FileInfo fileOrg = new FileInfo(path);
            if (fileOrg.Exists)
            {
                fileOrg.Delete();
            }
        }


        public static void DeleteListImage(string listItem)
        {
            if (!string.IsNullOrEmpty(listItem))
            {

                var Items = listItem.Split(',').Where(p => p != string.Empty).ToList();
                foreach (var item in Items)
                {
                    var getImage = PostModel.Get(Convert.ToInt32(item));
                    if (getImage != null)
                    {
                        DeleteFile(getImage.GUID, "~/Uploads/");
                        DeleteFile(getImage.GUID, "~/Uploads/thumb/");
                        DeleteFile(getImage.GUID, "~/Uploads/medium/");
                        DeleteFile(getImage.GUID, "~/Uploads/large/");
                    }
                }

                PostModel.DeleteList(listItem);
            }
        }


        public static void CropImage(HttpContext http, dynamic imageEdit)
        {
            var crop = Util.Crop(imageEdit.PhysicalApplicationPath + "uploads\\large\\" + imageEdit.FileName,
                imageEdit.w, imageEdit.h, imageEdit.x, imageEdit.y);

            var imageOrg = new WebImage(crop);

            imageOrg = imageOrg.Resize(150, 150);

            DeleteFile(imageEdit.FileName, "~/Uploads/thumb");

            imageOrg.Save(@"~\uploads\thumb\" + imageEdit.FileName);
        }



        /// <summary>
        /// Đọc tất cả các file trong một thư mục được chỉ định.
        /// </summary>
        /// <param name="virtualPath">đường dẫn tới thư mục</param>
        /// <param name="searchPattern">tên file tìm kiếm</param>
        /// <returns>tất cả các file trong thư mục đó.</returns>

        public static string[] GetAllPagesInFolder(string virtualPath, string searchPattern)
        {
            string physicalPath = HttpContext.Current.Server.MapPath(virtualPath);

            // childrenFiles are physical paths. We need to convert them into virtual paths
            string[] childrenFiles = Directory.EnumerateFiles(physicalPath, searchPattern, SearchOption.TopDirectoryOnly).ToArray();
            string[] childrenVirtualPaths = new string[childrenFiles.Length];

            for (int i = 0; i < childrenFiles.Length; ++i)
            {
                // convert physical path to virtual path
                childrenVirtualPaths[i] = childrenFiles[i].Replace(HttpContext.Current.Request.PhysicalApplicationPath, "~/").Replace(Path.DirectorySeparatorChar, '/');
            }

            return childrenVirtualPaths;
        }

        /// <summary>
        /// Lấy đường đẫn của một file của theme hiện hành.
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static string GetFilePath(string name = null)
        {
            var path = string.Empty;

            if (String.IsNullOrEmpty(name))
            {
                path = Themes.ThemeDirectory + "/" + Themes.CurrentTheme + "/content.cshtml";
            }
            else
            {
                path = Themes.ThemeDirectory + "/" + Themes.CurrentTheme + "/" + name + ".cshtml";
            }

            return path;
        }


        /// <summary>
        /// Chuyển đối số byte thành đơn vị tính tương ứng cho dễ đọc
        /// </summary>
        /// <param name="bytes">Số bytes cần chuyển</param>
        /// <param name="decimals">Lấy bao nhiêu phần lẻ</param>
        /// <returns>Trả về chuổi đơn vị tương ứng</returns>
        public static string SizeFormat(long bytes, int decimals = 0)
        {
            var quant = new Dictionary<string, long>();
            quant.Add("TB", 1099511627776);  // pow( 1024, 4)
            quant.Add("GB", 1073741824);// pow( 1024, 3)
            quant.Add("MB", 1048576);// pow( 1024, 2)
            quant.Add("kB", 1024);// pow( 1024, 1)
            quant.Add("B", 1);// pow( 1024, 0)

            foreach (var item in quant)
            {
                if (bytes >= item.Value)
                {
                    return String.Format("{0:f}", bytes / (item.Value * 1.0)) + " " + item.Key;
                }
            }
            return string.Empty;
        }

        public static void RemoveHeader()
        {
            HttpContext.Current.Response.Headers.Remove("Server");
            HttpContext.Current.Response.Headers.Remove("X-Powered-By");
            HttpContext.Current.Response.Headers.Remove("X-AspNet-Version");
            HttpContext.Current.Response.Headers.Remove("X-AspNetMvc-Version");

        }

    }




}