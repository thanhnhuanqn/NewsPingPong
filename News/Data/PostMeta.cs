namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("PostMeta")]
    public partial class PostMeta
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long PostMetaID { get; set; }
        public Nullable<long> PostID { get; set; }
        public string PMetaKey { get; set; }
        public string PMetaValue { get; set; }
    
        public virtual Posts Posts { get; set; }
    }
}
