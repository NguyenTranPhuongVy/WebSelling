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
            return PartialView();
        }
    }
}