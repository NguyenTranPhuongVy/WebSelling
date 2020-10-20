using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;
using EntityState = System.Data.EntityState;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class UsersController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: SellingAdmin/Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.City).Include(u => u.Province);
            return View(users.ToList());
        }

        // GET: SellingAdmin/Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: SellingAdmin/Users/Create
        public ActionResult Create()
        {
            ViewBag.City_ID = new SelectList(db.Cities, "City_ID", "City_Name");
            ViewBag.Province_ID = new SelectList(db.Provinces, "Province_ID", "Province_Name");
            return View();
        }

        // POST: SellingAdmin/Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address,Province_ID,City_ID")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.City_ID = new SelectList(db.Cities, "City_ID", "City_Name", user.City_ID);
            ViewBag.Province_ID = new SelectList(db.Provinces, "Province_ID", "Province_Name", user.Province_ID);
            return View(user);
        }

        // GET: SellingAdmin/Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.City_ID = new SelectList(db.Cities, "City_ID", "City_Name", user.City_ID);
            ViewBag.Province_ID = new SelectList(db.Provinces, "Province_ID", "Province_Name", user.Province_ID);
            return View(user);
        }

        // POST: SellingAdmin/Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "User_ID,User_LastName,User_Name,User_Token,User_Activate,User_Pass,User_Email,User_Phone,User_Role,User_LinkF,User_Img,User_DateCreate,User_DateLogin,User_DateBirth,User_Sex,User_Address,Province_ID,City_ID")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = (System.Data.Entity.EntityState)EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.City_ID = new SelectList(db.Cities, "City_ID", "City_Name", user.City_ID);
            ViewBag.Province_ID = new SelectList(db.Provinces, "Province_ID", "Province_Name", user.Province_ID);
            return View(user);
        }

        // GET: SellingAdmin/Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: SellingAdmin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
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
