namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("UserMeta")]

    public partial class UserMeta
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public long UserMetaID { get; set; }
        public Nullable<int> UserID { get; set; }
        public string UMetaKey { get; set; }
        public string UMetaValue { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
