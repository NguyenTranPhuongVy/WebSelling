﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSelling.Models;

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
        //Thêm sản phẩm
        [HttpPost]
        public ActionResult CreateProductUser([Bind(Include = "Product_ID,Product_Name,Product_Img,Product_DateSubmit,Product_Activate,Product_Price,Product_SalePrice,Product_Ship,Product_View,Product_Love,Product_Amount,Product_Description,Product_Detail,Product_Option,Product_DateCreate,Product_DateEdit,User_ID,SubCategory_ID,Category_ID,SubProduct_ID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Category_ID = new SelectList(db.Categories, "Category_ID", "Category_Name", product.Category_ID);
            ViewBag.SubCategory_ID = new SelectList(db.SubCategories, "SubCategory_ID", "SubCategory_Name", product.SubCategory_ID);
            ViewBag.SubProduct_ID = new SelectList(db.SubProducts, "SubProduct_ID", "SubProduct_Name", product.SubProduct_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "User_LastName", product.User_ID);
            return View(product);
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