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
    
    public partial class Comment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comment()
        {
            this.RepLis = new HashSet<RepLi>();
        }
    
        public int Comment_ID { get; set; }
        public Nullable<System.DateTime> Comment_DateCreate { get; set; }
        public string Comment_Content { get; set; }
        public Nullable<bool> Comment_Spam { get; set; }
        public Nullable<int> User_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RepLi> RepLis { get; set; }
    }
}
