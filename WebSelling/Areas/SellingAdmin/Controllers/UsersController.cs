﻿using System;
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
