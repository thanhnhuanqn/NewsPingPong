using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace News.Data
{
    //[MetadataType(typeof(CategoryMetaData))]
    public class CategoryMetaData
    {
        [Required(ErrorMessage = "Category Name is not empty")]
        public string CategoryName { get; set; }

        [AllowHtml]
        public string Description { get; set; }
    }

    //[MetadataType(typeof(PostsMetaData))]
    public class PostsMetaData
    {
        [Required(ErrorMessage = "Content is not empty")]
        [AllowHtml]
        public string Content { get; set; }

        [Required(ErrorMessage = "Title is not empty")]
        [MaxLength(70, ErrorMessage = "Title length maximum 70 characters")]
        public string Title { get; set; }

        [AllowHtml]
        [MaxLength(160, ErrorMessage = "Excerpt length maximum 160 characters")]
        public string Excerpt { get; set; }
    }
    //[MetadataType(typeof(RolesMetaData))]
    public class RolesMetaData
    {
        [Required(ErrorMessage = "Role Name is not empty")]
        public string RoleName { get; set; }
    }

    //[MetadataType(typeof(CommentsMetaData))]
    public class CommentsMetaData
    {
        [Required(ErrorMessage = "Content is not empty")]
        [AllowHtml]
        public string CommentContent { get; set; }
    }
}