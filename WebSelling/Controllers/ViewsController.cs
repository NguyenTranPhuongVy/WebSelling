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

namespace WebSelling.Controllers
{
    public class ViewsController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: Views
        public ActionResult Index()
        {
            var views = db.Views.Include(v => v.Product).Include(v => v.User);
            return View(views.ToList());
        }

        // GET: Views/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            View view = db.Views.Find(id);
            if (view == null)
            {
                return HttpNotFound();
            }
            return View(view);
        }

        // GET: Views/Create
        public ActionResult Create()
        {
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName");
            return View();
        }

        // POST: Views/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "View_ID,Product_ID,User_ID,View_Date")] View view)
        {
            if (ModelState.IsValid)
            {
                db.Views.Add(view);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", view.Product_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", view.User_ID);
            return View(view);
        }

        // GET: Views/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            View view = db.Views.Find(id);
            if (view == null)
            {
                return HttpNotFound();
            }
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", view.Product_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", view.User_ID);
            return View(view);
        }

        // POST: Views/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "View_ID,Product_ID,User_ID,View_Date")] View view)
        {
            if (ModelState.IsValid)
            {
                db.Entry(view).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", view.Product_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", view.User_ID);
            return View(view);
        }

        // GET: Views/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            View view = db.Views.Find(id);
            if (view == null)
            {
                return HttpNotFound();
            }
            return View(view);
        }

        // POST: Views/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            View view = db.Views.Find(id);
            db.Views.Remove(view);
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
