using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Controllers
{
    public class InvoicesController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: Invoices
        public ActionResult IndexCart()
        {
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            return View(ghtt);
        }

        //xu ly them vao gio hang
        public ActionResult CreateCart(int? id)
        {
            //In so tren thanh gio hang (truong hop khong co)
            if (Session["sptt"] == null)
            {
                Session["sptt"] = new List<SessionCart>();
                Session["dem"] = "Trống";
            }
            //xu ly lu sesion va +so ngay gio hang lay theo id san pha
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            if (ghtt.FirstOrDefault(n => n.Product_ID == id) == null)
            {
                Product sp = db.Products.Find(id);
                if (Session["dem"].ToString() == "Trống")
                    Session["dem"] = "0";
                Session["dem"] = Int32.Parse(Session["dem"].ToString()) + 1;
                SessionCart giatri = new SessionCart()
                {
                    Product_ID = sp.Product_ID,
                    Product_Img = sp.Product_Img,
                    Product_Name = sp.Product_Name,
                    Product_Price = decimal.ToInt32(sp.Product_Price.Value)
                };
                ghtt.Add(giatri);
            }
            else
            {
                SessionCart gh = ghtt.FirstOrDefault(n => n.Product_ID == id);
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}