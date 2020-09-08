using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;


namespace WebSelling.Controllers
{
    public class AccountController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        String ViewHome = "/";
        String srtHome = "/Home/Index";
        String ViewAcc = "/";
        String srtAcc = "/Account/Login";
        // GET: Account
        public ActionResult Login()
        {
            User user = (User)Session["user"];
            if(user != null)
            {
                return Redirect(ViewHome);
            }    
            return View();
        }
        //Đăng Nhập Người Dùng
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
                return Redirect(ViewHome);
            }   
            else
            {
                Session["Notlogin"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Sai tài khoản hoặc mật khẩu.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }    
        }

        //Đăng Ký Người Dùng
        [HttpPost]
        public ActionResult Registration([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address,Province_ID,City_ID")] User user, FormCollection f)
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
                Session["user"] = user;
                user.User_Activate = true;
                user.User_DateCreate = DateTime.Now;
                user.User_Role = 0;
                user.User_Token = Guid.NewGuid().ToString();
                db.Users.Add(user);
                db.SaveChanges();
                return Redirect("/Account/FormReg");
            }
        }
        public ActionResult Logout()
        {
            Session["user"] = null;
            return Redirect(ViewHome);
        }

        //Cập Nhật Thông Tin
        public PartialViewResult FormReg()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult FormReg(FormCollection f, DateTime User_DateBirth, String User_Sex)
        {
            User user = (User)Session["user"];
            User usernew = db.Users.SingleOrDefault(n => n.User_ID == user.User_ID);
            String sName = f["User_Name"].ToString();
            String sLName = f["User_LastName"].ToString();
            String sPhone = f["User_Phone"].ToString();
            String sFace = f["User_LinkF"].ToString();
            String sAdd = f["User_Address"].ToString();
            String sImg = f["User_Img"].ToString();
            String sProvince = f["User_Province"].ToString();
            String sCity = f["User_City"].ToString();
            db.Users.Find(user.User_ID).User_Name = sName;
            db.Users.Find(user.User_ID).User_LastName = sLName;
            db.Users.Find(user.User_ID).User_Phone = sPhone;
            db.Users.Find(user.User_ID).User_LinkF = sFace;
            db.Users.Find(user.User_ID).User_Address = sAdd;
            db.Users.Find(user.User_ID).User_DateBirth = User_DateBirth;
            db.Users.Find(user.User_ID).User_DateLogin = DateTime.Now;
            db.Users.Find(user.User_ID).User_Img = sImg;
            db.Users.Find(user.User_ID).User_City = sCity;
            db.Users.Find(user.User_ID).User_Province = sProvince;
            Session["user"] = usernew;
            db.SaveChanges();
            return Redirect(ViewHome);
        }

        //Form Thông Tin Cá Nhân
        public ActionResult Info()
        {
            User user = (User)Session["user"];
            if(user == null)
            {
                return Redirect(ViewAcc);
            }    
            return View();
        }
    }
}