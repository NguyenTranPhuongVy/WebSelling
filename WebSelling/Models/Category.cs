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
    
    public partial class Category
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Category()
        {
            this.SubProducts = new HashSet<SubProduct>();
        }
    
        public int Category_ID { get; set; }
        public string Category_Name { get; set; }
        public string Category_Img { get; set; }
        public Nullable<System.DateTime> Category_DateCreate { get; set; }
        public Nullable<System.DateTime> Category_DateEdit { get; set; }
        public Nullable<bool> Category_Activate { get; set; }
        public Nullable<int> SubCategory_ID { get; set; }
    
        public virtual SubCategory SubCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubProduct> SubProducts { get; set; }
    }
}
