namespace News.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [MetadataType(typeof(RolesMetaData))]
    [Table("Roles")]    

    public partial class Roles
    {
        
        public Roles()
        {
            this.Users = new HashSet<Users>();
        }
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int RoleID { get; set; }
        public string RoleName { get; set; }
            
        public virtual ICollection<Users> Users { get; set; }
    }
}
