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
    
    public partial class SubProduct
    {
        public int SubProduct_ID { get; set; }
        public Nullable<int> SubCategory_ID { get; set; }
        public string SubProduct_Name { get; set; }
    
        public virtual SubCategory SubCategory { get; set; }
    }
}
