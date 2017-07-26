namespace News.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class view_GetAllTagHavePost
    {
        public long CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Slug { get; set; }
        public long Count { get; set; }
    }
}
