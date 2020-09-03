using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class AccountController : Controller
    {
        SellingWebEntities db = new SellingWebEntities();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sEmail = f["user_email"].ToString();
            String sPass = f["user_pass"].ToString();
            User user = db.Users.Where(n => n.User_Activate == true && n.User_Role == 0).SingleOrDefault(n => n.User_Email == sEmail && n.User_Pass == sPass);
            if(user != null)
            {
                Session["user"] = user;
                db.Users.Find(user.User_ID).User_DateLogin = DateTime.Now;
                db.Users.Find(user.User_ID).User_Token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return Redirect("/Home/Index");
            }
            else
            {
                Session["Notlogin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fas fa-times-circle' style='color: red'>&nbsp;</i>Bạn chưa nhập email và mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }    
        }
        [HttpPost]
        public ActionResult Registration([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address")] User user, FormCollection f)
        {
            String sEmail = f["user_email"].ToString();
            String sPass = f["user_pass"].ToString();
            String sRepeatpass = f["user_pass2"].ToString();
            User test = db.Users.SingleOrDefault(n => n.User_Email == sEmail);
            if(test != null)
            {
                ViewBag.Show = "Email đã tồn tại !!! Vui lòng chọn email khác";
            }
            else
            {
                if(sPass == sRepeatpass)
                {
                    Session["user"] = user;
                    user.User_Token = Guid.NewGuid().ToString();
                    user.User_DateCreate = DateTime.Now;
                    user.User_DateLogin = DateTime.Now;
                    user.User_Role = 0;
                    user.User_Activate = true;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return Redirect("Home/Index");
                }
                else
                {
                    ViewBag.Show = "Mật Khẩu Nhập Lại Không Đúng";
                }    
            }    

            return View(user);
        }
        public ActionResult PageLogin()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return Redirect("Home/Index");
        }
    }
}