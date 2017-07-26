namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [MetadataType(typeof(PostsMetaData))]
    [Table("Posts")]
    public partial class Posts
    {        
        public Posts()
        {
            this.Comments = new HashSet<Comments>();
            this.PostMeta = new HashSet<PostMeta>();
            this.Category = new HashSet<Category>();
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long PostID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public string Content { get; set; }
        public string Title { get; set; }
        public string Excerpt { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> Modified { get; set; }
        public long Parent { get; set; }
        public string GUID { get; set; }
        public Nullable<int> Order { get; set; }
        public string Type { get; set; }
        public string CommentStatus { get; set; }
        public int CommentCount { get; set; }
    
        
        public virtual ICollection<Comments> Comments { get; set; }
        
        public virtual ICollection<PostMeta> PostMeta { get; set; }
        public virtual Users Users { get; set; }
        
        public virtual ICollection<Category> Category { get; set; }
    }
}
