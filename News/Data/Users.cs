namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Users")]
    public partial class Users
    {        
        public Users()
        {
            this.Comments = new HashSet<Comments>();
            this.Posts = new HashSet<Posts>();
            this.UserMeta = new HashSet<UserMeta>();
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public string NiceName { get; set; }
        public string Email { get; set; }
        public string Url { get; set; }
        public Nullable<System.DateTime> Registered { get; set; }
        public string ActivationKey { get; set; }
        public Nullable<bool> UserStatus { get; set; }
        public Nullable<int> RoleID { get; set; }
           
        public virtual ICollection<Comments> Comments { get; set; }    
        public virtual ICollection<Posts> Posts { get; set; }
        public virtual Roles Roles { get; set; }        
        public virtual ICollection<UserMeta> UserMeta { get; set; }
    }
}
