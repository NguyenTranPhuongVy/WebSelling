using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class ForgotPassController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: ForgotPass
        // Gửi mail
        public ActionResult Mail()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Mail(ForgotPass pass)
        {
            try
            {
                // Định cấu hình lớp webMail để gửi email  
                // máy chủ gmail smtp  
                WebMail.SmtpServer = "smtp.gmail.com";
                // cổng gmail để gửi email  
                WebMail.SmtpPort = 587;
                WebMail.SmtpUseDefaultCredentials = true;
                // gửi email với giao thức bảo mật  
                WebMail.EnableSsl = true;
                // EmailId được sử dụng để gửi email từ ứng dụng  
                WebMail.UserName = "nguyentranphuongvy99@gmail.com";
                WebMail.Password = "Phuongvy99##";

                // Địa chỉ email người gửi.  
                WebMail.From = "nguyentranphuongvy99@gmail.com";
                User user = db.Users.FirstOrDefault(t => t.User_Email == pass.Email);
                pass.Title= "Xác nhận đổi mật khẩu trang SellingMarket";
                pass.Content = "Xác nhận:'AAAAA";

                //Gửi email  
                WebMail.Send(to: pass.Email, subject: pass.Title, body: pass.Content, cc: pass.Cc, bcc: pass.Bcc, isBodyHtml: true);
                ViewBag.Status = "Email được gửi thành công.";
            }
            catch (Exception)
            {
                ViewBag.Status = "Sự cố trong khi gửi email, vui lòng kiểm tra chi tiết.";
            }
            return View();
        }

        //Thay đổi
        public ActionResult ChangePass()
        {
            return View();
        }
    }
}