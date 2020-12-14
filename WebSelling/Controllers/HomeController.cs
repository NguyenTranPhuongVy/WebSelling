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

        public ActionResult DetailsCategory(int? categoryid)
        {
            Category cate = db.Categories.SingleOrDefault(n => n.Category_ID == categoryid);
            Session["category"] = cate;
            List<Product> products = db.Products.Where(n => n.Category_ID == categoryid && n.Product_Activate == true && n.Product_Bin == false).OrderByDescending(n => n.Product_DateCreate).ToList();
            return View(products);
        }
        public ActionResult FilterProductBySubCatId(int? id)
        {
            if(id == null)
            {
                return HttpNotFound();
            }
            List<Product> products = db.Products.Where(t => t.Product_Activate == true && t.SubCategory_ID == id && t.Product_Bin == false).ToList();
            return View(products);
        }

        public PartialViewResult NewProduct()
        {
            return PartialView(db.Products.Where(n => n.Product_Activate == true && n.Product_Bin == false).OrderByDescending(n => n.Product_DateCreate).Take(12).ToList());
        }

        public PartialViewResult KeyWork()
        {
            return PartialView(db.SubCategories.Where(n => n.SubCategory_Activate == true).OrderBy(n => n.SubCategory_Name).ToList());
        }

        public ActionResult DetailsProduct(int ? id)
        {
            User user = (User)Session["user"];
            Product pro = db.Products.SingleOrDefault(n => n.Product_ID == id);
            if(pro == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            if(user != null)
            {
                List<View> views = db.Views.Where(n => n.User_ID == user.User_ID && n.Product_ID == id && n.View_Bin == false).ToList();
                ViewBag.Count = views.Count;
            }    
            Session["productid"] = id;
            db.Products.Find(id).Product_View++;
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