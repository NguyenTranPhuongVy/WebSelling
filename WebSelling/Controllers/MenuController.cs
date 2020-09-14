using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        SellingWebEntities db = new SellingWebEntities();
        public PartialViewResult Menu()
        {
            return PartialView();
        }
    }
}