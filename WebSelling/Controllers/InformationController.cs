using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using WebSelling.Models;
using System.Net;

namespace WebSelling.Controllers
{
    public class InformationController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        String ViewHome = "/";
        String strHome = "/Home/Index";
        String ViewAcc = "/";
        String strAcc = "/Account/Login";
        // GET: Information
        // trang thông tin cá nhân người dùng
        public ActionResult MyInforUser()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                return Redirect(ViewAcc);
            }
            return View();
        }
        //Thêm sản phẩm người dùng
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateProductUser([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product, HttpPostedFileBase fileupload)
        {
            User user = (User)Session["user"];
            //Tên hình ảnh
            var fileimg = Path.GetFileName(fileupload.FileName);
            //Đưa tên ảnh vào file
            var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
            if (fileupload == null)
            {
                ViewBag.ThongBao = "Ảnh Trống";
            }
            else if (System.IO.File.Exists(pa))
            {
                ViewBag.ThongBao = "Ảnh Trùng";
            }
            else
            {
                fileupload.SaveAs(pa);
            }
            db.Products.Add(product);
            product.Product_DateCreate = DateTime.Now;
            product.Product_DateSubmit = DateTime.Now;
            product.Product_DateEdit = DateTime.Now;
            product.Product_Activate = true;
            product.Product_Img = fileupload.FileName;
            product.User_ID = user.User_ID;
            db.SaveChanges();
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Sửa sản phẩm
        public ActionResult EditProduct(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return View(product);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProduct([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product, int? id, HttpPostedFileBase fileupload)
        {
            Product pro = db.Products.Find(id);
            if (fileupload == null)
            {
                product.Product_DateEdit = DateTime.Now;
                product.Product_DateSubmit = DateTime.Now;
                product.Product_Img = pro.Product_Img;
                product.Product_Activate = true;
                product.User_ID = pro.User_ID;
                db.SaveChanges();
                ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
                ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
                ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
                ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                var fileimg = Path.GetFileName(fileupload.FileName);
                //Đưa tên ảnh vào file
                var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
                if (fileupload == null)
                {
                    ViewBag.ThongBao = "Ảnh Trống";
                }
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh Trùng";
                }
                else
                {
                    fileupload.SaveAs(pa);
                }
                product.Product_DateEdit = DateTime.Now;
                product.Product_DateSubmit = DateTime.Now;
                product.Product_Img = fileupload.FileName;
                product.Product_Activate = true;
                product.User_ID = pro.User_ID;
                db.SaveChanges();
                ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
                ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
                ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
                ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
                return Redirect(Request.UrlReferrer.ToString());
            }
        }

        // trang thông tin người dùng
        public ActionResult InforUser(int ? id)
        {
            if(id == null)
            {
                return Redirect(ViewAcc);
            }
            return View(db.Users.Find(id));
        }
    }
}