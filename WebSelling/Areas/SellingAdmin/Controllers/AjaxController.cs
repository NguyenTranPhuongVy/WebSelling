using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class AjaxController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SellingAdmin/Ajax

        //Sản phẩm
        public PartialViewResult AllProduct()
        {
            return PartialView("_ViewProduct" , db.Products.ToList());
        }

        public PartialViewResult NewProduct()
        {
            return PartialView("_ViewProduct", db.Products.Where(n => n.Product_Activate == true).OrderByDescending(n => n.Product_DateCreate).ToList());
        }

        public PartialViewResult NoActivateProduct()
        {
            return PartialView("_ViewProduct", db.Products.Where(n => n.Product_Activate == false).OrderByDescending(n => n.Product_DateCreate).ToList());
        }

        //Bình luận
        public PartialViewResult Repli()
        {
            return PartialView("_ViewRep", db.RepLis.OrderByDescending(n => n.Repli_DateCreate).ToList());
        }

        public PartialViewResult Commment()
        {
            return PartialView("_ViewComment", db.Comments.OrderByDescending(n => n.Comment_DateCreate).ToList());
        }
    }
}