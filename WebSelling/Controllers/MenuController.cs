using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSelling.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        public PartialViewResult Menu()
        {
            return PartialView();
        }
    }
}