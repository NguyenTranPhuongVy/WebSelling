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
        WebSellingEntities db = new WebSellingEntities();
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult Category()
        {
            return PartialView(db.Categories.Where(n => n.Category_Activate == true).OrderBy(n => n.Category_DateCreate).ToList());
        }

        public ActionResult DetailsCategory(int ? categoryid)
        {
            Category cate = db.Categories.SingleOrDefault(n => n.Category_ID == categoryid);
            Session["category"] = cate;
            return View(db.Products.Where(n => n.Category_ID == categoryid && n.Product_Activate == true).OrderByDescending(n => n.Product_DateEdit).ToList());
        }

        public PartialViewResult NewProduct()
        {
            return PartialView(db.Products.Where(n => n.Product_Activate == true).OrderByDescending(n => n.Product_DateCreate).Take(12).ToList());
        }

        public PartialViewResult KeyWork()
        {
            return PartialView(db.SubCategories.Where(n => n.SubCategory_Activate == true).OrderBy(n => n.SubCategory_Name).ToList());
        }

        public ActionResult DetailsProduct(int productid)
        {
            Product pro = db.Products.SingleOrDefault(n => n.Product_ID == productid);
            if (pro == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Session["productid"] = productid;
            db.Products.Find(productid).Product_View++;
            db.SaveChanges();
            return View(pro);
        }

        public PartialViewResult SimilarProduct()
        {
            return PartialView(db.Products.Where(n => n.Product_Activate == true).OrderByDescending(n => n.Product_DateCreate).Take(15).ToList());
        }
        public PartialViewResult Css()
        {
            return PartialView();
        }
    }
}