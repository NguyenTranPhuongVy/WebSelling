using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class HomeAdminController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SellingAdmin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult CssAdmin()
        {
            return PartialView();
        }
    }
}