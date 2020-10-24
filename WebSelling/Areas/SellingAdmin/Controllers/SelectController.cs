using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class SelectController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SellingAdmin/Select
        //Thêm Admin
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

        //Sửa Admin
        [HttpPost]
        public ActionResult EditAdmin(FormCollection f, int? id)
        {
            String sAdminID = f["Admin_ID"].ToString();
            String sName = f["Admin_Name"].ToString();
            String sEmail = f["Admin_Email"].ToString();
            String sPass2 = f["Admin_Pass2"].ToString();
            id = Int32.Parse(sAdminID);
            db.Admins.Find(id).Admin_Name = sName;
            db.Admins.Find(id).Admin_Email = sEmail;
            db.Admins.Find(id).Admin_Pass2 = sPass2;
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Xem chi tiết sản phẩm
        public ActionResult ViewProduct(int ? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
    }
}