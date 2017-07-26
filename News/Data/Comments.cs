namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [MetadataType(typeof(CommentsMetaData))]
    [Table("Comments")]

    public partial class Comments
    {        
        public Comments()
        {
            this.CommentMeta = new HashSet<CommentMeta>();
        }
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long CommentID { get; set; }
        public Nullable<long> PostID { get; set; }
        public string AuthorName { get; set; }
        public string AuthorEmail { get; set; }
        public string AuthorUrl { get; set; }
        public string AuthorIP { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public string CommentContent { get; set; }
        public string Approved { get; set; }
        public string Agent { get; set; }
        public string CommentType { get; set; }
        public long CommentParent { get; set; }
        public Nullable<int> UserID { get; set; }
            
        public virtual ICollection<CommentMeta> CommentMeta { get; set; }
        public virtual Posts Posts { get; set; }
        public virtual Users Users { get; set; }
    }
}
