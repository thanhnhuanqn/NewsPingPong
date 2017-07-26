using News.Areas.Admin.Controllers.Components;
using News.Areas.Admin.Models;
using News.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public class TagModel : TermModel
    {        

        public static void AddList(decimal idPost, IEnumerable<string> tags, string taxonomy = "tag")
        {
            foreach (var tag in tags)
            {
                var category = Get(Util.UrlFriendly(tag));

                if (category == null)
                {

                    string slugnew = Util.CreatePostNameFriendly(tag, checkSlugExists);

                    Category tagNew = new Category();
                    tagNew.CategoryName = tag;
                    tagNew.Slug = slugnew;
                    tagNew.CategoryType = taxonomy;
                    tagNew.CategoryParent = 0;
                    tagNew.Count = 0;
                    Add(tagNew);

                    var tag_new = Get(slugnew);

                    PostModel.AddRelationShips(idPost, tag_new.CategoryID);
                }
                else
                {
                    PostModel.AddRelationShips(idPost, category.CategoryID);
                }
            }
        }

        public static void DeleteListTags(string listItem)
        {
            if (!string.IsNullOrEmpty(listItem))
            {

                string[] arraySlug = listItem.Split(',').Where(t => t != string.Empty).ToArray();

                if (arraySlug.Count() > 0)
                {
                    foreach (var slug in arraySlug)
                    {
                        Remove(slug);
                    }
                }
            }

        }

        public static void Create(Category term)
        {
            term.CategoryName = TermModel.Trim(term.CategoryName);
            term.Slug = TermModel.Trim(term.Slug);
            term.Description = TermModel.Trim(term.Description);

            if (string.IsNullOrWhiteSpace(term.Slug))
            {
                term.Slug = Util.CreatePostNameFriendly(term.CategoryName, checkSlugExists);
            }
            else
            {
                term.Slug = Util.CreatePostNameFriendly(term.Slug, checkSlugExists);
            }

            term.CategoryType = "tag";
            term.CategoryParent = 0;
            term.Count = 0;

            TermModel.Add(term);

        }

        public static void Update(Category newData, Category olData)
        {
            newData.CategoryName = TermModel.Trim(newData.CategoryName);
            newData.Slug = TermModel.Trim(newData.Slug);
            newData.Description = TermModel.Trim(newData.Description);

            if (string.IsNullOrWhiteSpace(newData.Slug))
            {
                newData.Slug = Util.CreatePostNameFriendly(newData.CategoryName, checkSlugExists, int.Parse(olData.CategoryID.ToString()));
            } else
            {
                newData.Slug = Util.CreatePostNameFriendly(newData.Slug, checkSlugExists, int.Parse(olData.CategoryID.ToString()));
            }

            newData.CategoryID = olData.CategoryID;
            newData.CategoryType = olData.CategoryType;
            newData.CategoryParent = olData.CategoryParent;
            newData.Count = olData.Count;
            using (var context = newContext)
            {
                context.Entry(newData).State = EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}