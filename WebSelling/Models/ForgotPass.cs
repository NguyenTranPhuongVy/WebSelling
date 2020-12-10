using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSelling.Models
{
    public class ForgotPass
    {
        public int ForgotID { get; set; }
        public string Email { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Bcc { get; set; }
        public string Cc { get; set; }
    }
}