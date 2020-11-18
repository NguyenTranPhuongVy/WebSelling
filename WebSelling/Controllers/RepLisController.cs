using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class RepLisController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: RepLis
        public ActionResult Index()
        {
            var repLis = db.RepLis.Include(r => r.Comment).Include(r => r.User);
            return View(repLis.ToList());
        }

        // GET: RepLis/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RepLi repLi = db.RepLis.Find(id);
            if (repLi == null)
            {
                return HttpNotFound();
            }
            return View(repLi);
        }

        // GET: RepLis/Create
        public ActionResult Create()
        {
            ViewBag.Comment_ID = new SelectList(db.Comments, "Comment_ID", "Comment_Content");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName");
            return View();
        }

        // POST: RepLis/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Repli_ID,Repli_DateCreate,Repli_Content,Comment_ID,User_ID")] RepLi repLi)
        {
            if (ModelState.IsValid)
            {
                db.RepLis.Add(repLi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Comment_ID = new SelectList(db.Comments, "Comment_ID", "Comment_Content", repLi.Comment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", repLi.User_ID);
            return View(repLi);
        }

        // GET: RepLis/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RepLi repLi = db.RepLis.Find(id);
            if (repLi == null)
            {
                return HttpNotFound();
            }
            ViewBag.Comment_ID = new SelectList(db.Comments, "Comment_ID", "Comment_Content", repLi.Comment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", repLi.User_ID);
            return View(repLi);
        }

        // POST: RepLis/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Repli_ID,Repli_DateCreate,Repli_Content,Comment_ID,User_ID")] RepLi repLi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(repLi).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Comment_ID = new SelectList(db.Comments, "Comment_ID", "Comment_Content", repLi.Comment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", repLi.User_ID);
            return View(repLi);
        }

        // GET: RepLis/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RepLi repLi = db.RepLis.Find(id);
            if (repLi == null)
            {
                return HttpNotFound();
            }
            return View(repLi);
        }

        // POST: RepLis/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RepLi repLi = db.RepLis.Find(id);
            db.RepLis.Remove(repLi);
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
