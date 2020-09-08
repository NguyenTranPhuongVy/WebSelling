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
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Carts = new HashSet<Cart>();
            this.Comments = new HashSet<Comment>();
            this.SubProducts = new HashSet<SubProduct>();
        }
    
        public int Product_ID { get; set; }
        public string Product_Name { get; set; }
        public string Product_Img { get; set; }
        public Nullable<System.DateTime> Product_DateSubmit { get; set; }
        public Nullable<bool> Product_Activate { get; set; }
        public Nullable<decimal> Product_Price { get; set; }
        public Nullable<decimal> Product_SalePrice { get; set; }
        public Nullable<bool> Product_Ship { get; set; }
        public Nullable<int> Product_View { get; set; }
        public Nullable<int> Product_Love { get; set; }
        public Nullable<int> Product_Amount { get; set; }
        public string Product_Description { get; set; }
        public string Product_Detail { get; set; }
        public Nullable<bool> Product_Option { get; set; }
        public Nullable<System.DateTime> Product_DateCreate { get; set; }
        public Nullable<System.DateTime> Product_DateEdit { get; set; }
        public Nullable<int> User_ID { get; set; }
        public Nullable<int> SubCategory_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubProduct> SubProducts { get; set; }
    }
}
