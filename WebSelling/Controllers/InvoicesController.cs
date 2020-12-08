using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
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
            User user = (User)Session["user"];
            Product pro = db.Products.SingleOrDefault(n => n.Product_ID == id);
            //In so tren thanh gio hang (truong hop khong co)
            if (Session["sptt"] == null)
            {
                Session["sptt"] = new List<SessionCart>();
                Session["dem"] = "Trống";
            }
            //xu ly lu sesion va +so ngay gio hang lay theo id san pha
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            if (ghtt.FirstOrDefault(n => n.Product_ID == id) == null && user.User_ID != pro.User_ID)
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
                    Product_Price = decimal.ToInt32(sp.Product_Price.Value),
                    User_LastName = sp.User.User_LastName,
                    User_Name = sp.User.User_Name
                };
                ghtt.Add(giatri);
            }
            else
            {
                SessionCart gh = ghtt.FirstOrDefault(n => n.Product_ID == id);
            }
            return Redirect(Request.UrlReferrer.ToString());
        }

        [HttpGet]
        public ActionResult Pay()
        {
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            return View(ghtt);
        }
        [HttpPost]
        public ActionResult PayProduct([Bind(Include = "Invoices_ID,Invoices_Buyer,Invoices_Seller,Invoices_Address,Invoices_Phone,User_ID,Invoices_TotalPay,Invoices_DateCreate,Invoices_Note,StatusBill_ID,Invoices_EmailSeller")] Invoice invoice)
        {
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            Product product = db.Products.Find(Int32.Parse(Session["productid"].ToString()));
            db.Invoices.Add(invoice);
            invoice.Invoices_DateCreate = DateTime.Now;
            invoice.Invoices_EmailSeller = product.User.User_Email;
            invoice.StatusBill_ID = 1;
            product.Product_Activate = false;
            db.SaveChanges();
            return RedirectToAction("PayDetail", new { id = invoice.Invoices_ID});
        }

        public RedirectToRouteResult PayDetail(int id)
        {
            int ma;
            List<SessionCart> ghtt = Session["sptt"] as List<SessionCart>;
            foreach (var item in ghtt)
            {
                DetailsInvoice dh = new DetailsInvoice();
                dh.Invoices_ID = id;
                dh.Product_ID = item.Product_ID;
                ma = item.Product_ID;
                db.DetailsInvoices.Add(dh);
            }
            db.SaveChanges();
            return RedirectToAction("Index","Home");
        }

        public ActionResult ViewCartInFo()
        {
            var invoices = db.Invoices.Include(i => i.StatusBill).Include(i => i.User);
            return View(invoices.ToList());
        }

        public ActionResult EditPay()
        {
            User user = (User)Session["user"];
            List<DetailsInvoice> detailsInvoices = db.DetailsInvoices.Where(n => n.Product.User_ID == user.User_ID).ToList();
            return View(detailsInvoices);
        }

        [HttpPost]
        public ActionResult EditPay(FormCollection f, int ? id)
        {
            String sInvoicesID = f["Invoices_ID"].ToString();
            String sStatusBill_ID = f["StatusBill_ID"].ToString();
            id = Int32.Parse(sInvoicesID);
            db.Invoices.Find(id).StatusBill_ID = Int32.Parse(sStatusBill_ID);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}