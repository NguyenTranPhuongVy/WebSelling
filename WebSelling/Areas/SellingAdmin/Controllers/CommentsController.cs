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
    public class CommentsController : Controller
    {
        private WebSellingEntities db = new WebSellingEntities();

        // GET: SellingAdmin/Comments
        public ActionResult Index()
        {
            var comments = db.Comments.Include(c => c.Product).Include(c => c.User);
            return View(comments.OrderByDescending(n => n.Comment_DateCreate).ToList());
        }
    }
}
