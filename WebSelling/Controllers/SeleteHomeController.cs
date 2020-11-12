using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class SeleteHomeController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SeleteHome
        public ActionResult Category(int ? id)
        {
            Category cate = db.Categories.SingleOrDefault(n => n.Category_ID == id);
            Session["category"] = cate;
            return View("_DetailCategory",db.Products.Where(n => n.Category_ID == id && n.Product_Activate == true).OrderByDescending(n => n.Product_DateEdit).ToList());
        }
    }
}