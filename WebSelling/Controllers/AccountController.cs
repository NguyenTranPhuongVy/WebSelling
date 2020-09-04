using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
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
                Session["Notlogin"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Sai tài khoản hoặc mật khẩu.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }    
        }
        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Registration([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address")] User user, FormCollection f)
        {
            String sEmail = f["User_Email"].ToString();
            User Testuser = db.Users.SingleOrDefault(n => n.User_Email == sEmail);
            if(Testuser != null)
            {
                Session["TestRegistration"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Email đã tồn tại.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }    
            else
            {
                user.User_Activate = true;
                user.User_DateCreate = DateTime.Now;
                user.User_Role = 0;
                user.User_Token = Guid.NewGuid().ToString();
                db.Users.Add(user);
                db.SaveChanges();
                return Redirect("/Account/FormReg");
            }
        }
        public ActionResult PageLogin()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return Redirect("/Home/Index");
        }

        public PartialViewResult FormReg()
        {
            return PartialView();
        }
    }
}