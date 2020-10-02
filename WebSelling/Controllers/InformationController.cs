using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class InformationController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        String ViewHome = "/";
        String strHome = "/Home/Index";
        String ViewAcc = "/";
        String strAcc = "/Account/Login";
        // GET: Information
        // trang thông tin cá nhân người dùng
        public ActionResult MyInforUser()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                return Redirect(ViewAcc);
            }
            return View();
        }

        // trang thông tin người dùng
        public ActionResult InforUser(int ? id)
        {
            if(id == null)
            {
                return Redirect(ViewAcc);
            }
            return View(db.Users.Find(id));
        }
    }
}