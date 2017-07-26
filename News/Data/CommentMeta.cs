namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("CommentMeta")]

    public partial class CommentMeta
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long CommentMetaID { get; set; }
        public Nullable<long> CommentID { get; set; }
        public string CMetaKey { get; set; }
        public string CMetaValue { get; set; }
    
        public virtual Comments Comments { get; set; }
    }
}
