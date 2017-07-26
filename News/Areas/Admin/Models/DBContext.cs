using News.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace News.Areas.Admin.Models
{
    public abstract class DBContext
    {
        internal static NewsEntities newContext { get { return new NewsEntities(); } }

    }
}