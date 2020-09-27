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
            return View(/*db.Products.Where(n => n .Product_Activate == true && n.User_ID == user.User_ID).OrderByDescending(n => n.Product_DateCreate).ToList()*/);
        }

        // trang thông tin người dùng người khác
        public ActionResult InforUser(int ? id)
        {
            if(id == null)
            {
                return Redirect(ViewAcc);
            }
            // rồi đúng thì ra trang nào ??? thì ra cái trang 
            return View(db.Users.Find(id));
        }
    }
}