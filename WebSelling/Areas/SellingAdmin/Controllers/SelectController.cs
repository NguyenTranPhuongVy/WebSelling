using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

namespace WebSelling.Areas.SellingAdmin.Controllers
{
    public class SelectController : Controller
    {
        WebSellingEntities db = new WebSellingEntities();
        // GET: SellingAdmin/Select
        //Thêm Admin
        public ActionResult CreateAdmin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateAdmin([Bind(Include = "Admin_ID,Admin_Pass,Admin_Pass2,Admin_Email,Admin_Role,Admin_Token,Admin_Activate,Admin_DateCreate,Admin_DateLogin,Admin_Name")] Admin admin)
        {
            Session["admin"] = admin;
            admin.Admin_DateCreate = DateTime.Now;
            admin.Admin_DateLogin = DateTime.Now;
            admin.Admin_Token = Guid.NewGuid().ToString();
            admin.Admin_Role = 1;
            admin.Admin_Activate = true;
            db.Admins.Add(admin);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Sửa Admin
        [HttpPost]
        public ActionResult EditAdmin(FormCollection f, int? id)
        {
            String sAdminID = f["Admin_ID"].ToString();
            String sName = f["Admin_Name"].ToString();
            String sEmail = f["Admin_Email"].ToString();
            String sPass2 = f["Admin_Pass2"].ToString();
            String sActive = f["Admin_Active"].ToString();
            id = Int32.Parse(sAdminID);
            db.Admins.Find(id).Admin_Name = sName;
            db.Admins.Find(id).Admin_Email = sEmail;
            db.Admins.Find(id).Admin_Pass2 = sPass2;
            db.Admins.Find(id).Admin_Activate = Boolean.Parse(sActive);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Xem chi tiết sản phẩm
        public ActionResult ViewProduct(int ? id)
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
            return View(product);
        }

        //Thêm sản phẩm
        public ActionResult CreateProduct()
        {
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name");
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name");
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName");
            return View();
        }

        [HttpPost]
        public ActionResult CreateProduct([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product, HttpPostedFileBase fileupload)
        {
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
            db.SaveChanges();
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return Redirect(Request.UrlReferrer.ToString());
        }
        //Xoá Sản Phẩm

        //Xem danh mục
        public ActionResult ViewCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //Xem chi tiết sản phẩm
        public ActionResult DetailsCategory(int ? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Thêm Danh Mục
        public ActionResult CreateCategory()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateCategory([Bind(Include = "Category_ID,Category_Name,Category_Img,Category_DateCreate,Category_DateEdit,Category_Activate")] Category category, HttpPostedFileBase fileupload)
        {
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
            db.Categories.Add(category);
            category.Category_Img = fileupload.FileName;
            category.Category_DateCreate = DateTime.Now;
            category.Category_DateEdit = DateTime.Now;
            category.Category_Activate = true;
            db.SaveChanges();
            return Redirect("/SellingAdmin/Categories");
        }

        //Sửa danh mục
        [HttpPost]
        public ActionResult EditCategory(FormCollection f,int ? id, HttpPostedFileBase fileedit)
        {    
            String sCategoryName = f["Category_Name"].ToString();
            String sCategoryID = f["Category_ID"].ToString();
            String sActive = f["Category_Activate"].ToString();
            id = Int32.Parse(sCategoryID);
            Category cate = db.Categories.Find(id);
            if (fileedit == null)
            {
                db.Categories.Find(id).Category_Name = sCategoryName;
                db.Categories.Find(id).Category_DateEdit = DateTime.Now;
                db.Categories.Find(id).Category_Activate = Boolean.Parse(sActive);
                db.Categories.Find(id).Category_Img = cate.Category_Img;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                //Tên hình ảnh
                var fileimg = Path.GetFileName(fileedit.FileName);
                //Đưa tên ảnh vào file
                var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
                if (fileedit == null)
                {
                    ViewBag.ThongBao = "Ảnh Trống";
                }
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh Trùng";
                }
                else
                {
                    fileedit.SaveAs(pa);
                }
                db.Categories.Find(id).Category_Name = sCategoryName;
                db.Categories.Find(id).Category_DateEdit = DateTime.Now;
                db.Categories.Find(id).Category_Activate = Boolean.Parse(sActive);
                db.Categories.Find(id).Category_Img = fileedit.FileName;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
        }

        //Thêm Danh Mục Phụ
        public ActionResult CreateSubCategory()
        {
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name");
            return View();
        }

        [HttpPost]
        public ActionResult CreateSubCategory([Bind(Include = "SubCategory_ID,SubCategory_Name,SubCategory_Img,SubCategory_DateCreate,SubCategory_DateEdit,SubCategory_Activate,Category_ID")] SubCategory subCategory, HttpPostedFileBase fileup)
        {
            //Tên hình ảnh
            var fileimg = Path.GetFileName(fileup.FileName);
            //Đưa tên ảnh vào file
            var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
            if (fileup == null)
            {
                ViewBag.ThongBao = "Ảnh Trống";
            }
            else
            {
                fileup.SaveAs(pa);
            }
            db.SubCategories.Add(subCategory);
            subCategory.SubCategory_Img = fileup.FileName;
            subCategory.SubCategory_DateCreate = DateTime.Now;
            subCategory.SubCategory_DateEdit = DateTime.Now;
            subCategory.SubCategory_Activate = true;
            db.SaveChanges();
            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", subCategory.Category_ID);
            return Redirect(Request.UrlReferrer.ToString());
        }

        //Sửa danh mục phụ
        public ActionResult EditSubCategory(FormCollection f, int ? id, HttpPostedFileBase fileedit)
        {
            String sSubCategory_ID = f["SubCategory_ID"].ToString();
            String sName = f["SubCategory_Name"].ToString();
            String sActive = f["SubCategory_Activate"].ToString();
            id = Int32.Parse(sSubCategory_ID);
            SubCategory sub = db.SubCategories.Find(id);
            if (fileedit == null)
            {
                db.SubCategories.Find(id).SubCategory_Name = sName;
                db.SubCategories.Find(id).SubCategory_DateEdit = DateTime.Now;
                db.SubCategories.Find(id).SubCategory_Activate = Boolean.Parse(sActive);
                db.SubCategories.Find(id).SubCategory_Img = sub.SubCategory_Img;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                //Tên hình ảnh
                var fileimg = Path.GetFileName(fileedit.FileName);
                //Đưa tên ảnh vào file
                var pa = Path.Combine(Server.MapPath("~/Content/Image/"), fileimg);
                if (fileedit == null)
                {
                    ViewBag.ThongBao = "Ảnh Trống";
                }
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh Trùng";
                }
                else
                {
                    fileedit.SaveAs(pa);
                }
                db.SubCategories.Find(id).SubCategory_Name = sName;
                db.SubCategories.Find(id).SubCategory_DateEdit = DateTime.Now;
                db.SubCategories.Find(id).SubCategory_Activate = Boolean.Parse(sActive);
                db.SubCategories.Find(id).SubCategory_Img = fileedit.FileName;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
    }
}