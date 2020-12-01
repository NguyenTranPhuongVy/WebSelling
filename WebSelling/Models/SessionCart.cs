using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSelling.Models
{
    public class SessionCart
    {
        public int Product_ID { get; set; }
        public string Product_Img { get; set; }
        public string Product_Name { get; set; }
        public int Product_Price { get; set; }
        public int TotalPrice { get; set; }
        public string User_LastName { get; set; }
        public string User_Name { get; set; }
    }
}