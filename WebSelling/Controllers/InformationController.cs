using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using WebSelling.Models;
using System.Net;
using System.Data.Entity;

namespace WebSelling.Controllers
{
    public class InformationController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        String ViewHome = "/";
        String strHome = "/Home/Index";
        String ViewAcc = "/";
        String strAcc = "/Account/Login";
        String favourite = "/Home/DetailsProduct/";
        // GET: Information
        // trang thông tin cá nhân người dùng
        public ActionResult MyInforUser()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
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
            product.Product_Love = 0;
            product.Product_View = 0;
            db.SaveChanges();
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Sửa sản phẩm
        public ActionResult EditProductUser(int? id)
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
        public ActionResult EditProductUser([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product, HttpPostedFileBase fileeditproduct)
        {
            if (ModelState.IsValid)
            {
                if (fileeditproduct != null)
                {
                    //Tên file ảnh sản phẩm
                    var fileimg = Path.GetFileName(fileeditproduct.FileName);
                    // Đưa tên ảnh vào đúng file
                    var pa = Path.Combine(Server.MapPath("~/Content/Image"), fileimg);
                    // Ảnh trống
                    if (fileeditproduct == null)
                    {
                        ViewBag.ThongBao = "Ảnh trống !";
                        return View(product);
                    }
                    //Lưu pa vào name fileUpload
                    fileeditproduct.SaveAs(pa);
                    product.Product_Img = fileeditproduct.FileName;
                }
                product.Product_DateEdit = DateTime.Now;
                product.Product_DateSubmit = DateTime.Now;
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return Redirect("/Account/ListProductsUser");
            }
            return View(product);
        }

        //Thêm yêu thích
        [HttpPost]
        public ActionResult CreateFavourite([Bind(Include = "View_ID,Product_ID,User_ID,View_Date,View_Bin")] View view, int ? id)
        {
            User user = (User)Session["user"];
            if(user != null)
            {
                db.Views.Add(view);
                view.View_Bin = false;
                view.View_Date = DateTime.Now;
                view.User_ID = user.User_ID;
                view.Product_ID = id;
                db.SaveChanges();
                return Redirect(favourite + id);
            }
            else
            {
                return Redirect(strAcc);
            }
        }
        //Huỷ yêu thích
        public ActionResult DeleteFavourite(int ? id)
        {
            View view = db.Views.Find(id);
            view.View_Bin = true;
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
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