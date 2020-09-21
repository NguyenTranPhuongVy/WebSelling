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
        public ActionResult InforUser()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                return Redirect(ViewAcc);
            }
            return View(/*db.Products.Where(n => n .Product_Activate == true && n.User_ID == user.User_ID).OrderByDescending(n => n.Product_DateCreate).ToList()*/);
        }
    }
}