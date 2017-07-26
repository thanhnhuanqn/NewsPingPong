using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class OptionModel : DBContext
    {

        internal static NewsEntities db = new NewsEntities();

        public static string BlogName
        {
            get;
            set;
        }

        public static string BlogDescription { get; set; }
        public static string AdminEmail { get; set; }
        public static string UserCanRegister { get; set; }
        public static string DefaultRole { get; set; }
        public static string DefaultCategory { get; set; }
        public static string MailServerUrl { get; set; }
        public static string MailServerLogin { get; set; }
        public static string MailServerPass { get; set; }
        public static int MailServerPort { get; set; }
        public static string DefaultEmailCategory { get; set; }
        public static int PostsPerPage { get; set; }
        //load setting Media
        public static int ThumbnailW { get; set; }
        public static int ThumbnailH { get; set; }
        public static int ThumbnailCrop { get; set; }
        public static int MediumW { get; set; }
        public static int MediumH { get; set; }
        public static int LargeW { get; set; }
        public static int LargeH { get; set; }

        public static string TitleCurrent { get; set; }

        public static void GetOptions()
        {
            using (var context = newContext)
            {
                var result = context.Options;

                if (result != null)
                {
                    foreach (var key in result)
                    {
                        string k = Convert.ToString(key.OptionName).Trim();
                        switch (k)
                        {
                            case "blogname":
                                BlogName = key.OptionValue;
                                break;
                            case "blogdescription":
                                BlogDescription = key.OptionValue;
                                break;
                            case "admin_email":
                                AdminEmail = key.OptionValue;
                                break;
                            case "users_can_register":
                                UserCanRegister = key.OptionValue;
                                break;
                            case "default_role":
                                DefaultRole = key.OptionValue;
                                break;
                            case "default_category":
                                DefaultCategory = key.OptionValue;
                                break;
                            case "mailserver_url":
                                MailServerUrl = key.OptionValue;
                                break;
                            case "mailserver_port":
                                MailServerPort = Convert.ToInt32(key.OptionValue);
                                break;
                            case "mailserver_login":
                                MailServerLogin = key.OptionValue;
                                break;
                            case "mailserver_pass":
                                MailServerPass = key.OptionValue;
                                break;
                            case "default_email_category":
                                DefaultEmailCategory = key.OptionValue;
                                break;
                            case "posts_per_page":
                                PostsPerPage = Convert.ToInt32(key.OptionValue);
                                break;
                            case "thumbnail_size_w":
                                ThumbnailW = Convert.ToInt32(key.OptionValue);
                                break;
                            case "thumbnail_size_h":
                                ThumbnailH = Convert.ToInt32(key.OptionValue);
                                break;
                            case "thumbnail_crop":
                                ThumbnailCrop = Convert.ToInt32(key.OptionValue);
                                break;
                            case "medium_size_w":
                                MediumW = Convert.ToInt32(key.OptionValue);
                                break;
                            case "medium_size_h":
                                MediumH = Convert.ToInt32(key.OptionValue);
                                break;
                            case "large_size_w":
                                LargeW = Convert.ToInt32(key.OptionValue);
                                break;
                            case "large_size_h":
                                LargeH = Convert.ToInt32(key.OptionValue);
                                break;
                        }
                    }
                }
            }
        }

        public static void Create(IDictionary<dynamic, dynamic> options)
        {
            foreach (var item in options)
            {
                CreateKeyValue(item.Key, item.Value);
            }
        }

        public static void CreateKeyValue(dynamic key, dynamic value)
        {

            dynamic checkKey = GetOption(key);

            if (checkKey == null)
            {
                using (var context = newContext)
                {
                    if (key != null && value != null)
                    {
                        context.Options.Add(new Options { OptionName = key.ToString(), OptionValue = value.ToString() });
                        context.SaveChanges();
                    }
                }
            }
            else
            {
                Options option = GetOptionIdNameValue(key);
                if (option != null)
                {
                    UpdateKey(option.OptionID, key.ToString(), value.ToString());
                }
            }



        }

        public static void UpdateKey(decimal option_id, string option_name, string option_value)
        {

            var model = db.Options.Where(o => o.OptionID == option_id && o.OptionName == option_name).FirstOrDefault();

            if (model != null)
            {
                model.OptionValue = option_value;
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
            }


        }

        private static void DeleteKey(string key)
        {
            using (var db = newContext)
            {
                var model = db.Options.Where(o => o.OptionName == key).FirstOrDefault();
                if (model != null)
                {
                    db.Options.Remove(model);
                    db.SaveChanges();
                }
            }
        }

        public static dynamic GetOption(string key)
        {
            using (var context = newContext)
            {
                if (!string.IsNullOrEmpty(key))
                {
                    var model = context.Options.Where(o => o.OptionName == key).FirstOrDefault();
                    if (model != null)
                        return model.OptionValue;
                }
            }
            return null;
        }

        public static dynamic GetOptionIdNameValue(string key)
        {
            if (!string.IsNullOrEmpty(key))
            {
                return db.Options.Where(o => o.OptionName == key).FirstOrDefault();
            }
            return null;
        }
    }
}