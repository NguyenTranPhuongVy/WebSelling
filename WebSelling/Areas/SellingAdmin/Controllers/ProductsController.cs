using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class ProductsController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: SellingAdmin/Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.SubCategory).Include(p => p.SubProduct).Include(p => p.User);
            return View(products.ToList());
        }

        // GET: SellingAdmin/Products/Details/5
        public ActionResult Details(int? id)
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

        // GET: SellingAdmin/Products/Create
        public ActionResult Create()
        {
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name");
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name");
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName");
            return View();
        }

        // POST: SellingAdmin/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID,Product_Bin")] Product product)
        {
            if (ModelState.IsValid)
            {
                product.Product_Bin = false;
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return View(product);
        }

        // GET: SellingAdmin/Products/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return View(product);
        }

        // POST: SellingAdmin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return View(product);
        }

        // GET: SellingAdmin/Products/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: SellingAdmin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
