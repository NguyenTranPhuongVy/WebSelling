using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
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
        String strHome = "/Home/Index";
        String ViewAcc = "/";
        String strAcc = "/Account/Login";
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
            Admin admin = db.Admins.Where(n => n.Admin_Activate == true && n.Admin_Role == 1).SingleOrDefault(n => n.Admin_Email == sEmail && n.Admin_Pass == sPass);
            if(user != null)
            {
                Session["user"] = user;
                db.Users.Find(user.User_ID).User_DateLogin = DateTime.Now;
                db.Users.Find(user.User_ID).User_Token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return Redirect(ViewHome);
            }
            else if(admin != null)
            {
                Session["admin"] = admin;
                db.Admins.Find(admin.Admin_ID).Admin_DateLogin = DateTime.Now;
                db.Admins.Find(admin.Admin_ID).Admin_Token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return Redirect("/SellingAdmin/HomeAdmin/AdminLoginForm");
            }    
            else
            {
                Session["Notlogin"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Không có thông tin đăng nhập.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }    
        }

        //Test Validation
        public PartialViewResult ScriptValidation()
        {
            return PartialView();
        }    

        //Đăng Ký Người Dùng
        [HttpPost]
        public ActionResult Registration([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address,Province_ID,City_ID")] User user, FormCollection f)
        {
            String sEmail = f["User_Email"].ToString();
            User Testuser = db.Users.SingleOrDefault(n => n.User_Email == sEmail);
            if(Testuser != null)
            {
                Session["Testsignup"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Email đã tồn tại.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
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
        //Ajax Address 
        public PartialViewResult ajaxFilterProvinceByCityID(int City_Id)
        {
            List<Province> provinces = db.Provinces.Where(t => t.City_ID == City_Id).ToList();
            return PartialView(provinces);
        }
        //Cập Nhật Thông Tin
        public PartialViewResult FormReg()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult FormReg(FormCollection f, DateTime User_DateBirth, String User_Sex, String Province_ID, String City_ID, HttpPostedFileBase fileupload)
        {
            //Tên hình ảnh
            var fileimg = Path.GetFileName(fileupload.FileName);
            //Đưa tên ảnh vào file
            var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
            if (fileupload == null)
            {
                ViewBag.ThongBao = "Ảnh Trống";
            }
            else if (System.IO.File.Exists(pa))
            {
                ViewBag.ThongBao = "Ảnh Trùng";
            }
            else
            {
                fileupload.SaveAs(pa);
            }
            User user = (User)Session["user"];
            User usernew = db.Users.SingleOrDefault(n => n.User_ID == user.User_ID);
            String sName = f["User_Name"].ToString();
            String sLName = f["User_LastName"].ToString();
            String sPhone = f["User_Phone"].ToString();
            String sFace = f["User_LinkF"].ToString();
            String sAdd = f["User_Address"].ToString();
            String sProvince = f["Province_ID"].ToString();
            String sCity = f["City_ID"].ToString();
            String sSex = f["User_Sex"].ToString();
            db.Users.Find(user.User_ID).User_Name = sName;
            db.Users.Find(user.User_ID).User_LastName = sLName;
            db.Users.Find(user.User_ID).User_Phone = sPhone;
            db.Users.Find(user.User_ID).User_LinkF = sFace;
            db.Users.Find(user.User_ID).User_Address = sAdd;
            db.Users.Find(user.User_ID).User_DateBirth = User_DateBirth;
            db.Users.Find(user.User_ID).User_DateLogin = DateTime.Now;
            db.Users.Find(user.User_ID).User_Img = fileupload.FileName;
            db.Users.Find(user.User_ID).City_ID = Int32.Parse(sCity.ToString());
            db.Users.Find(user.User_ID).Province_ID = Int32.Parse(sProvince.ToString());
            db.Users.Find(user.User_ID).User_Sex = Int32.Parse(sSex.ToString());
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

        //Chỉnh sửa thông tin cá nhân
        public PartialViewResult EditProfile()
        {
            return PartialView("_ViewProfileUser");
        }

        [HttpPost]
        public ActionResult EditProfile([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address,Province_ID,City_ID")] User user, HttpPostedFileBase fileprofile)
        {
            User us = (User)Session["user"];
            if(fileprofile == null)
            {
                db.Entry(user).State = EntityState.Modified;
                user.User_Token = Guid.NewGuid().ToString();
                user.User_Activate = true;
                user.User_DateCreate = us.User_DateCreate;
                user.User_DateLogin = DateTime.Now;
                user.User_Pass = us.User_Pass;
                user.User_Sex = us.User_Sex;
                user.User_Role = 0;
                user.User_Img = us.User_Img;
                user.User_Email = us.User_Email;
                user.City_ID = us.City_ID;
                user.Province_ID = us.Province_ID;
                db.SaveChanges();
                Session["user"] = db.Users.Find(us.User_ID);
                return Redirect(Request.UrlReferrer.ToString());
            }    
            else
            {
                //Tên hình ảnh
                var fileimg = Path.GetFileName(fileprofile.FileName);
                //Đưa tên ảnh vào file
                var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
                if (fileprofile == null)
                {
                    ViewBag.ThongBao = "Ảnh Trống";
                }
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh Trùng";
                }
                else
                {
                    fileprofile.SaveAs(pa);
                }
                db.Entry(user).State = EntityState.Modified;
                user.User_Img = fileprofile.FileName;
                user.User_Activate = true;
                user.User_Token = Guid.NewGuid().ToString();
                user.User_DateCreate = us.User_DateCreate;
                user.User_Role = 0;
                user.User_DateLogin = DateTime.Now;
                user.User_Pass = us.User_Pass;
                user.User_Sex = us.User_Sex;
                user.User_Email = us.User_Email;
                user.City_ID = us.City_ID;
                user.Province_ID = us.Province_ID;
                db.SaveChanges();
                Session["user"] = db.Users.Find(us.User_ID);
                return Redirect(Request.UrlReferrer.ToString());
            }
        }

        //Sửa mật khẩu
        public ActionResult EditPass()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EditPass(FormCollection f, int ? id)
        {
            User us = db.Users.Find(id);
            User user = (User)Session["user"];
            String sOldPass = f["OldPass"].ToString();
            String sNewPass = f["NewPass"].ToString();
            String sRePass = f["RePass"].ToString();
            if(sOldPass != us.User_Pass)
            {
                ViewBag.TestPass = "Mật Khẩu Không Đúng";
            }
            else
            {
                if(sNewPass != sRePass)
                {
                    ViewBag.CheckPass = "Mật Khẩu Mới Không Khớp";
                } 
                else
                {
                    us.User_Pass = sNewPass;
                    db.SaveChanges();
                    Session["user"] = db.Users.Find(us.User_ID);
                    return Redirect(Request.UrlReferrer.ToString());
                }    
            }
            return View();
        }

        //Bình luận 
        public PartialViewResult ViewComment(int ? id)
        {
            List<Comment> comments = db.Comments.Where(n => n.Product_ID == id).OrderByDescending(n => n.Comment_DateCreate).ToList();
            return PartialView(comments);
        }

        [HttpPost]
        public ActionResult ViewComment([Bind(Include = "Comment_ID,Comment_DateCreate,Comment_Content,Comment_Spam,User_ID,Product_ID")] Comment comment)
        {
            User user = (User)Session["user"];
            comment.User_ID = user.User_ID;
            comment.Comment_DateCreate = DateTime.Now;
            db.Comments.Add(comment);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Trả lời
        public PartialViewResult ViewRep(int ? id)
        {
            List<RepLi> replis = db.RepLis.Where(n => n.Comment_ID == id).OrderByDescending(n => n.Repli_DateCreate).ToList();
            return PartialView(replis);
        }

        [HttpPost]
        public ActionResult ViewRep([Bind(Include = "Repli_ID,Repli_DateCreate,Repli_Content,Comment_ID,User_ID")] RepLi repLi)
        {
            User user = (User)Session["user"];
            repLi.User_ID = user.User_ID;
            repLi.Repli_DateCreate = DateTime.Now;
            db.RepLis.Add(repLi);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

        ////Chỉnh sửa bình luận
        //public ActionResult EditComment(FormCollection f ,int ? id)
        //{
        //    User user = (User)Session["user"];
        //    String sID = f["Comment_ID"].ToString();
        //    String sContent = f["Comment_Content"].ToString();
        //    Comment comment = db.Comments.SingleOrDefault(n => n.Comment_ID == id && n.User_ID == user.User_ID);
        //    if(user != null)
        //    {
        //        db.Comments.Find(comment).Comment_Content = sContent;
        //        db.Comments.Find(comment).Comment_DateCreate = comment.Comment_DateCreate;
        //        db.Comments.Find(comment).User_ID = user.User_ID;
        //        db.Comments.Find(comment).Product_ID = comment.Product_ID;
        //        db.SaveChanges();
        //        return Redirect(Request.UrlReferrer.ToString());
        //    }    
        //    else
        //    {

        //    }    
        //}

        public ActionResult ListProductsUser()
        {
            User user = (User)Session["user"];
            List<View> views = db.Views.Where(n => n.View_Bin == false && n.User_ID == user.User_ID).OrderByDescending(n => n.View_Date).ToList();
            return View(views);
        }

        public ActionResult ProductLove()
        {
            User user = (User)Session["user"];
            List<View> views = db.Views.Where(n => n.View_Bin == false && n.User_ID == user.User_ID).OrderByDescending(n => n.View_Date).ToList();
            return View( "_ViewLove" , views);
        }

        public PartialViewResult ProductsActivate()
        {
            User user = (User)Session["user"];
            return PartialView("_DetailCategory", db.Products.Where(n => n.User_ID == user.User_ID && n.Product_Activate == true).OrderByDescending(n => n.Product_DateCreate).ToList());
        }

        public PartialViewResult ProductsNoActivate()
        {
            User user = (User)Session["user"];
            return PartialView("_DetailCategory", db.Products.Where(n => n.User_ID == user.User_ID && n.Product_Activate == false).OrderByDescending(n => n.Product_DateCreate).ToList());
        }
    }
}