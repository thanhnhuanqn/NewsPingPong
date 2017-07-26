namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Category")]
    [MetadataType(typeof(CategoryMetaData))]    
    public partial class Category
    {        
        public Category()
        {
            this.Posts = new HashSet<Posts>();
        }
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Slug { get; set; }
        public string CategoryType { get; set; }
        public string Description { get; set; }
        public long CategoryParent { get; set; }
        public long Count { get; set; }
           
        public virtual ICollection<Posts> Posts { get; set; }
    }
}
