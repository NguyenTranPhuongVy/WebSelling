using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class DetailsInvoicesController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: SellingAdmin/DetailsInvoices
        public ActionResult Index()
        {
            var detailsInvoices = db.DetailsInvoices.Include(d => d.Invoice).Include(d => d.Product);
            return View(detailsInvoices.ToList());
        }
    }
}
