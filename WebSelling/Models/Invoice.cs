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
    
    public partial class Invoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Invoice()
        {
            this.DetailsInvoices = new HashSet<DetailsInvoice>();
        }
    
        public int Invoices_ID { get; set; }
        public string Invoices_Buyer { get; set; }
        public string Invoices_Seller { get; set; }
        public string Invoices_Address { get; set; }
        public string Invoices_Phone { get; set; }
        public Nullable<int> User_ID { get; set; }
        public Nullable<int> Invoices_TotalPay { get; set; }
        public Nullable<System.DateTime> Invoices_DateCreate { get; set; }
        public string Invoices_Note { get; set; }
        public Nullable<int> StatusBill_ID { get; set; }
        public string Invoices_EmailSeller { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetailsInvoice> DetailsInvoices { get; set; }
        public virtual StatusBill StatusBill { get; set; }
        public virtual User User { get; set; }
    }
}
