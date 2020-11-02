using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;
using EntityState = System.Data.Entity.EntityState;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class SubProductsController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: SellingAdmin/SubProducts
        public ActionResult Index()
        {
            var subProducts = db.SubProducts.Include(s => s.SubCategory);
            return View(subProducts.ToList());
        }

        // GET: SellingAdmin/SubProducts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubProduct subProduct = db.SubProducts.Find(id);
            if (subProduct == null)
            {
                return HttpNotFound();
            }
            return View(subProduct);
        }

        // GET: SellingAdmin/SubProducts/Create
        public ActionResult Create()
        {
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name");
            return View();
        }

        // POST: SellingAdmin/SubProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SubProduct_ID,SubCategory_ID,SubProduct_Name")] SubProduct subProduct)
        {
            if (ModelState.IsValid)
            {
                db.SubProducts.Add(subProduct);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", subProduct.SubCategory_ID);
            return View(subProduct);
        }

        // GET: SellingAdmin/SubProducts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubProduct subProduct = db.SubProducts.Find(id);
            if (subProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", subProduct.SubCategory_ID);
            return View(subProduct);
        }

        // POST: SellingAdmin/SubProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SubProduct_ID,SubCategory_ID,SubProduct_Name")] SubProduct subProduct)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", subProduct.SubCategory_ID);
            return View(subProduct);
        }

        // GET: SellingAdmin/SubProducts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubProduct subProduct = db.SubProducts.Find(id);
            if (subProduct == null)
            {
                return HttpNotFound();
            }
            return View(subProduct);
        }

        // POST: SellingAdmin/SubProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubProduct subProduct = db.SubProducts.Find(id);
            db.SubProducts.Remove(subProduct);
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
