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
    
    public partial class DetailsInvoice
    {
        public int DetailsInvoices_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
        public Nullable<int> Invoices_ID { get; set; }
    
        public virtual Invoice Invoice { get; set; }
        public virtual Product Product { get; set; }
    }
}
