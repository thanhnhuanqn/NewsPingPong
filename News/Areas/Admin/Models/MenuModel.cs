using News.Areas.Admin.Controllers.Components;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class MenuModel : PostModel
    {        
        private static void AddItemToPostMeta(long postId, string meta_key, string meta_value)
        {

            PostMetaModel.CreateKeyValue(postId, meta_key, meta_value);
        }

        public static void AddToMenu(dynamic ItemsMenu)
        {
            //menu_item_page -array 
            //menu_item_category -array

            //menu_name_group -item single, 
            //menu_item_url -item single
            //menu_item_title -item single

            var post_author = 1;
            var post_title = string.Empty;
            var post_content = string.Empty;
            var post_date = DateTime.Now;

            using (var db = newContext)
            {
                int CategoryID = int.Parse(ItemsMenu.menu_name_group);

                var Category = db.Category.Where(t => t.CategoryID == CategoryID).FirstOrDefault();

                //how to short, current it's long, maybe code to function (yes ?)
                //item nav page ? 
                if (!string.IsNullOrEmpty(ItemsMenu.menu_item_page))
                {
                    var PageArray = ItemsMenu.menu_item_page.Split(',');

                    foreach (var item in PageArray)
                    {
                        Posts Page = Get(Convert.ToInt32(item));

                        if (Page != null)
                        {
                            var page = new Posts();
                            page.Content = "Add page " + Page.Title + " to menu  " + Category.CategoryName;
                            page.Modified = DateTime.Now;
                            page.Created = DateTime.Now;
                            page.Type = "nav_menu_item";
                            page.Title = Page.Title;
                            page.Content = Page.Content;
                            page.Name = Util.CreatePostNameFriendly(Page.Name, CheckPostNameExists);
                            page.UserID = page.UserID;
                            page.Parent = 0;
                            page.Order = 0;                            
                            page.CommentCount = 0;
                            page.CommentStatus = "Open";
                            page.Excerpt = "Add page";


                            using (var context = newContext)
                            {
                                context.Posts.Add(page);
                                context.SaveChanges();
                            }

                            var PostItem = db.Posts.Where(i => i.Name == page.Name).FirstOrDefault();

                            if (PostItem != null && Category != null)
                            {
                                long PageID = PostItem.PostID;

                                PostModel.AddLinkCategories(Category.CategoryID.ToString(), PostItem.Name);

                                AddItemToPostMeta(PageID, "_item_menu_type", "page");
                                AddItemToPostMeta(PageID, "_item_menu_post_parent", Page.PostID.ToString());

                            }


                        }
                    }
                }

                //item nav category
                if (!string.IsNullOrEmpty(ItemsMenu.menu_item_category))
                {
                    var CategoryArray = ItemsMenu.menu_item_category.Split(',');

                    foreach (var item in CategoryArray)
                    {
                        Category Menu = TermModel.Get(Convert.ToInt32(item));

                        if (Menu != null)
                        {

                            var page = new Posts();

                            page.Parent = 0;
                            page.CommentCount = 0;
                            page.CommentStatus = "Open";
                            page.Type = "nav_menu_item";                            
                            page.Title = Menu.CategoryName;
                            page.Content = "Add Category " + Menu.CategoryName + " to menu  " + Category.CategoryName;                            
                            page.Created = post_date;
                            page.Modified = DateTime.Now;
                            page.Order = 0;                                                        
                            
                            page.Name = Util.CreatePostNameFriendly(Menu.Slug, CheckPostNameExists);
                            
                            using (var context = newContext)
                            {
                                context.Posts.Add(page);
                                context.SaveChanges();
                            }

                            var PostItem = db.Posts.Where(i => i.Name == page.Name).FirstOrDefault();

                            if (PostItem != null && Category != null)
                            {
                                long PageID = PostItem.PostID;

                                PostModel.AddLinkCategories(Category.CategoryID.ToString(), PostItem.Name);

                                AddItemToPostMeta(PageID, "_item_menu_type", "category");
                                AddItemToPostMeta(PageID, "_item_menu_cat_parent", Menu.CategoryID.ToString());
                            }

                        }
                    }
                }

                //item nav link (custom)
                if (!string.IsNullOrWhiteSpace(ItemsMenu.menu_item_title))
                {

                    var page = new Posts();                    
                    page.Created = DateTime.Now;
                    page.Parent = 0;
                    page.CommentCount = 0;
                    page.CommentStatus = "Open";
                    page.Modified = DateTime.Now;
                    page.Order = 0;
                    page.Title = ItemsMenu.menu_item_title;
                    page.Type = "nav_menu_item";
                    page.Content = "Add custom link to menu  ";
                    page.Name = Util.CreatePostNameFriendly(page.Title, CheckPostNameExists);
                    

                    using (var context = newContext)
                    {
                        context.Posts.Add(page);
                        context.SaveChanges();
                    }

                    var PostItem = db.Posts.Where(i => i.Name == page.Name).FirstOrDefault();

                    if (PostItem != null && Category != null)
                    {
                        PostModel.AddLinkCategories(Category.CategoryID.ToString(), PostItem.Name);

                        long PostID = PostItem.PostID;

                        AddItemToPostMeta(PostID, "_item_menu_type", "custom");
                        AddItemToPostMeta(PostID, "_item_menu_url", ItemsMenu.menu_item_url);
                    }


                }
            }
        }


        public static void UpdateMenuItems(string menu_item_id, string menu_item_name, string menu_item_order, string nav_item_parent)
        {
            if (!string.IsNullOrEmpty(menu_item_id))
            {
                var idPosts = menu_item_id.Split(',');
                var namePosts = menu_item_name.Split(',');
                var orderPosts = menu_item_order.Split(',');
                var parentPosts = nav_item_parent.Split(',');

                using (var db = newContext)
                {
                    int i = 0;
                    foreach (var item in idPosts)
                    {
                        decimal Post_ID = int.Parse(item.ToString());

                        var post = db.Posts.Find(Post_ID);
                        if (post != null)
                        {
                            post.Title = namePosts[i];
                            post.Order = Convert.ToInt32(orderPosts[i]);
                            post.Parent = Convert.ToInt32(parentPosts[i]);
                            post.Excerpt = "Updated";

                            db.Entry(post).State = EntityState.Modified;
                            db.SaveChanges();
                        }

                        i++;
                    }
                }
            }
        }

        public static IEnumerable<Posts> GetMenuItemByMenuId(decimal idTerm)
        {
            var context = newContext;

            var data = context.Posts.Include(p => p.Category).Where(t => t.Category.Where(i => i.CategoryID == idTerm).Count() > 0).Where(o => o.Type == "nav_menu_item").OrderBy(d => d.Order);
            return data;
        }


        public static IEnumerable<Posts> GetMenuItemChildByMenuId(decimal post_parent)
        {
            var context = newContext;

            return context.Posts.Include("Category").Where(p => p.Parent == post_parent && p.Type == "nav_menu_item").OrderBy(d => d.Order);

        }


        public static dynamic GetOriginalItem(decimal postId)
        {
            dynamic obj = new ExpandoObject();

            obj.name = string.Empty;
            obj.type = string.Empty;
            obj.slug = string.Empty;
            obj.id = string.Empty;


            using (var db = newContext)
            {
                var itemType = PostMetaModel.GetMetaKey(postId, "_item_menu_type");

                int CategoryID = Convert.ToInt32(PostMetaModel.GetMetaKey(postId, "_item_menu_cat_parent"));

                if ("category".Equals(itemType))
                {
                    var result = TermModel.Get(CategoryID);
                    if (result != null)
                    {
                        obj.name = result.CategoryName;
                        obj.type = "Category";
                        obj.slug = result.Slug;
                        obj.id = result.CategoryID;
                    }
                }

                if ("product_cat".Equals(itemType))
                {
                    var result = TermModel.Get(CategoryID);
                    if (result != null)
                    {
                        obj.name = result.CategoryName;
                        obj.type = "ProductCategory";
                        obj.slug = result.Slug;
                        obj.id = result.CategoryID;
                    }
                }

                if ("page".Equals(itemType))
                {
                    var result = PostModel.Get(postId);
                    if (result != null)
                    {
                        obj.name = result.Title;
                        obj.type = "Page";
                        obj.slug = result.Name;
                        obj.id = result.PostID;
                    }
                }

                if ("custom".Equals(itemType))
                {
                    var result = PostModel.Get(postId);
                    if (result != null)
                    {
                        obj.name = result.Title;
                        obj.type = "Custom";
                        obj.slug = result.Name;
                        obj.id = result.PostID;
                    }
                }


                return obj;
            }
        }


        public static void RemoveItemMenu(decimal? idPost)
        {
            using (var context = newContext)
            {
                var post = context.Posts.Include("PostMeta").Where(p => p.PostID == idPost).FirstOrDefault();


                if (post != null)
                {
                    PostModel.RemoveRelationShips(post.PostID);
                    post.PostMeta.Clear();
                    context.Posts.Remove(post);
                    context.SaveChanges();

                }
            }
        }

        public static void DeleteMeta(int postId)
        {

            var meta = db.PostMeta.Where(p => p.PostID == postId);
            if (meta != null)
            {
                db.PostMeta.RemoveRange(meta);
                db.SaveChanges();

            }

        }


        public static string getMenuNavByPostId(decimal postId)
        {
            var post = db.Posts.Include("Category").FirstOrDefault(p => p.PostID == postId);
            if (post != null)
            {
                var category = post.Category.FirstOrDefault();

                if (category != null)
                {
                    return category.Slug;
                }
            }

            return string.Empty;
        }



        public static void DeleteNavMenu(string slug)
        {
            var term = TermModel.Get(slug);


            using (var context = newContext)
            {
                var posts = context.Posts.Include(p => p.Category).Where(t => t.Category.Where(i => i.CategoryID == term.CategoryID).Count() > 0);

                if (posts != null)
                {

                    foreach (var item in posts)
                    {
                        var del = context.Posts.Find(item.PostID);
                        if (del != null)
                        {
                            RemoveItemMenu(del.PostID);
                        }
                    }
                }
            }
            if (term != null)
            {
                TermModel.Remove(slug);
            }
        }
    }

}