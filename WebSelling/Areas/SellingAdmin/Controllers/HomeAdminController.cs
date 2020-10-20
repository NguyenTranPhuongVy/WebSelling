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

        public ActionResult CreateAdmin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateAdmin([Bind(Include = "Admin_ID,Admin_Pass,Admin_Pass2,Admin_Email,Admin_Role,Admin_Token,Admin_Activate,Admin_DateCreate,Admin_DateLogin,Admin_Name")] Admin admin)
        {
            Session["admin"] = admin;
            admin.Admin_DateCreate = DateTime.Now;
            admin.Admin_DateLogin = DateTime.Now;
            admin.Admin_Token = Guid.NewGuid().ToString();
            admin.Admin_Role = 1;
            admin.Admin_Activate = true;
            db.Admins.Add(admin);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}