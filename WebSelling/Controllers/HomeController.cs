using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;
using System.Net;
using PagedList;
using PagedList.Mvc;


namespace WebSelling.Controllers
{
    public class HomeController : Controller
    {
        SellingWebEntities db = new SellingWebEntities();
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult Category(int ? categoryid)
        {
            Category cate = db.Categories.SingleOrDefault(n => n.Category_ID == categoryid);
            Session["category"] = cate.Category_ID;
            return PartialView(db.Categories.Where(n => n.Category_Activate == true).OrderBy(n => n.Category_DateCreate).ToList());
        }

        public ActionResult Product()
        {
            return View();
        }

        public PartialViewResult KeyWork()
        {
            return PartialView(db.SubCategories.Where(n => n.SubCategory_Activate == true).OrderBy(n => n.SubCategory_Name).ToList());
        }
    }
}