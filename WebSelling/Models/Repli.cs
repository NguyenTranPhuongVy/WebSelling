//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebSelling.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Repli
    {
        public int Repli_ID { get; set; }
        public Nullable<System.DateTime> Repli_DateCreate { get; set; }
        public string Repli_Content { get; set; }
        public Nullable<int> Comment_ID { get; set; }
        public Nullable<int> User_ID { get; set; }
    
        public virtual Comment Comment { get; set; }
        public virtual User User { get; set; }
    }
}
