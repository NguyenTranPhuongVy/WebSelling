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
    public class Invoices1Controller : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: Invoices1
        public ActionResult Index()
        {
            var invoices = db.Invoices.Include(i => i.StatusBill).Include(i => i.User);
            return View(invoices.ToList());
        }

        // GET: Invoices1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // GET: Invoices1/Create
        public ActionResult Create()
        {
            ViewBag.StatusBill_ID = new SelectList(db.StatusBills, "StatusBill_ID", "StatusBill_Name");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName");
            return View();
        }

        // POST: Invoices1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Invoices_ID,Invoices_Buyer,Invoices_Seller,Invoices_Address,Invoices_Phone,User_ID,Invoices_TotalPay,Invoices_DateCreate,Invoices_Note,StatusBill_ID,Invoices_EmailSeller")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Invoices.Add(invoice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StatusBill_ID = new SelectList(db.StatusBills, "StatusBill_ID", "StatusBill_Name", invoice.StatusBill_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", invoice.User_ID);
            return View(invoice);
        }

        // GET: Invoices1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            ViewBag.StatusBill_ID = new SelectList(db.StatusBills, "StatusBill_ID", "StatusBill_Name", invoice.StatusBill_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", invoice.User_ID);
            return View(invoice);
        }

        // POST: Invoices1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Invoices_ID,Invoices_Buyer,Invoices_Seller,Invoices_Address,Invoices_Phone,User_ID,Invoices_TotalPay,Invoices_DateCreate,Invoices_Note,StatusBill_ID,Invoices_EmailSeller")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StatusBill_ID = new SelectList(db.StatusBills, "StatusBill_ID", "StatusBill_Name", invoice.StatusBill_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", invoice.User_ID);
            return View(invoice);
        }

        // GET: Invoices1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // POST: Invoices1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Invoice invoice = db.Invoices.Find(id);
            db.Invoices.Remove(invoice);
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
