using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class HomeAdminController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SellingAdmin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult CssAdmin()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult LoginAdmin(FormCollection f)
        {
            String sEmail = f["user_email"].ToString();
            String sPass = f["user_pass"].ToString();
            Admin admin = db.Admins.Where(n => n.Admin_Activate == true && n.Admin_Role == 1).SingleOrDefault(n => n.Admin_Email == sEmail && n.Admin_Pass2 == sPass);
            if (admin != null)
            {
                Session["admin"] = admin;
                db.Admins.Find(admin.Admin_ID).Admin_DateLogin = DateTime.Now;
                db.Admins.Find(admin.Admin_ID).Admin_Token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return Redirect("/SellingAdmin/HomeAdmin/Index");
            }
            else
            {
                Session["Notlogin"] = "<div class='alert alert-default alert-dismissible fade show' role='alert'><strong>Lưu ý!</strong> Không có thông tin đăng nhập.<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
    }
}