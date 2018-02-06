using EasyEvents.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Xml.Linq;


namespace EasyEvents.WebApp.Controllers
{
    public class CateringController : Controller
    {
        private EasyEventContext db = new EasyEventContext();

        //
        // GET: /Catering/

        public ActionResult Index()
        {
            var packages = (from s in db.CatererPackages.Include("CatererPackageMenu")
                            where s.CatererPackageMenu.PackageId == s.PackageId && s.IsActive == true
                            orderby s.Price
                            select s).ToList();

            var categories = (from s in db.Categories
                              select s).ToList();

            List<CateringPackage> model = new List<CateringPackage>();
            foreach (var package in packages)
            {
                string packageXML = package.CatererPackageMenu.PackageXML;
                XElement packageDetails = XElement.Parse(packageXML);
                List<Tuple<byte, string, string[]>> menuList = new List<Tuple<byte, string, string[]>>();
                int categoryCount = packageDetails.Elements("Category").Count();
                byte i = 0;
                foreach (XElement category in packageDetails.Elements("Category"))
                {
                    i++;
                    if (i > 7)
                    {
                        break;
                    }
                    byte categoryId = byte.Parse(category.Element("Id").Value);
                    byte choice = byte.Parse(category.Element("Choice").Value);
                    string categoryName;
                    if (choice > 1)
                    {
                        categoryName = categories.Where(s => s.ID == categoryId).Select(x => x.PluralName).Single();
                    }
                    else
                    {
                        categoryName = categories.Where(s => s.ID == categoryId).Select(x => x.Name).Single();
                    }
                    menuList.Add(new Tuple<byte, string, string[]>(choice, categoryName, null));
                }
                model.Add(new CateringPackage()
                {
                    Id = package.PackageId,
                    Name = package.Name,
                    Price = package.Price,
                    MinPerson = package.MinPerson,
                    ItemsCount = package.ItemsCount,
                    RemainingCategoryCount = (byte)(categoryCount - 7),
                    Menu = menuList
                });
            }

            return View(model);
        }

        public ActionResult PackageDetails(short id)
        {
            var packages = (from s in db.CatererPackages.Include("CatererPackageMenu")
                            where s.PackageId == id && s.CatererPackageMenu.PackageId == s.PackageId && s.IsActive == true
                            select s).ToList();

            var categories = (from s in db.Categories
                              select s).ToList();

            var menuitems = (from s in db.CatererMasterMenus
                             select s).ToList();

            CateringPackage model = new CateringPackage();
            if (0 == packages.Count() || 0 == categories.Count || 0 == menuitems.Count)
            {
                RedirectToAction("Error", "PageNotFound");
            }
            else
            {
                var reviews = (from s in db.CateringReview
                               where s.IsActive == true
                               orderby s.DbCreatedUtc descending
                               select s).Take(5).ToList();
                foreach (var package in packages)
                {
                    string packageXML = package.CatererPackageMenu.PackageXML;
                    XElement packageDetails = XElement.Parse(packageXML);
                    List<Tuple<byte, string, string[]>> menuList = new List<Tuple<byte, string, string[]>>();
                    foreach (XElement category in packageDetails.Elements("Category"))
                    {
                        byte categoryId = byte.Parse(category.Element("Id").Value);
                        byte choice = byte.Parse(category.Element("Choice").Value);
                        string[] item = category.Element("Item").Value.Split(',');
                        string categoryName;
                        if (choice > 1)
                        {
                            categoryName = categories.Where(s => s.ID == categoryId).Select(x => x.PluralName).Single();
                        }
                        else
                        {
                            categoryName = categories.Where(s => s.ID == categoryId).Select(x => x.Name).Single();
                        }
                        string[] itemNames = (from p in menuitems
                                              where item.Contains(p.ID.ToString())
                                              orderby p.Name
                                              select p.Name).ToArray();
                        menuList.Add(new Tuple<byte, string, string[]>(choice, categoryName, itemNames));
                    }
                    model = new CateringPackage()
                    {
                        Id = package.PackageId,
                        Name = package.Name,
                        Price = package.Price,
                        MinPerson = package.MinPerson,
                        ItemsCount = package.ItemsCount,
                        Menu = menuList,
                        Reviews = reviews
                    };
                }
            }

            return View(model);
        }

        public ActionResult Packages()
        {
            var packages = (from s in db.CatererPackages
                            where s.IsActive == true
                            orderby s.Price
                            select s).Take(3).ToList();

            return PartialView("~/Views/Shared/Packages.cshtml", packages);
        }

        public ActionResult CatererDetails()
        {
            return View();
        }
    }
}
