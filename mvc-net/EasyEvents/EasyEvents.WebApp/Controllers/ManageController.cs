using EasyEvents.WebApp.Models;
using PagedList;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace EasyEvents.WebApp.Controllers
{
    [Authorize]
    public class ManageController : Controller
    {
        private EasyEventContext db = new EasyEventContext();

        int pageSize = 10;
        int pageNumber = 1;

        //
        // GET: /Manage/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult CheckLogin()
        {
            if (Request["name"] == "admin" && Request["password"] == "Pass@123")
            {
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket("admin", true, 15);
                string encTicket = FormsAuthentication.Encrypt(authTicket);
                HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                Response.Cookies.Add(faCookie);
                return RedirectToAction("Index");
            }
            TempData["message"] = "Invalid login name and password";
            return RedirectToAction("Login");
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult CreateOrder()
        {
            return PartialView(new CateringOrder { ID = 0, EventDate = DateTime.UtcNow.Date });
        }

        //Edit
        public ActionResult EditOrder(int id)
        {
            CateringOrder order = db.CateringOrder.Find(id);
            return PartialView("CreateOrder", order);
        }

        [HttpPost]
        public ActionResult CreateOrder(CateringOrder cateringOrder)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (cateringOrder.ID <= 0)
                    {
                        cateringOrder.GUID = Guid.NewGuid();
                        db.CateringOrder.Add(cateringOrder);
                    }
                    else
                    {
                        db.Entry(cateringOrder).State = EntityState.Modified;
                    }
                    db.SaveChanges();
                    if (cateringOrder.ID <= 0)
                    {
                        TempData["Success"] = "Order created successfully.";
                    }
                    else
                    {
                        TempData["Success"] = "Order updated successfully.";
                    }
                    return PartialView("CreateOrder");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty,
                            ex.Message);
                }
            }
            return PartialView("CreateOrder");
        }


        public ActionResult OrderList(int? typeid, int? page)
        {
            pageNumber = (page ?? 1);
            typeid = (typeid ?? 1);

            var orders = from s in db.CateringOrder
                         where (typeid == 1 && (s.EventDate >= DateTime.UtcNow && s.IsCancelled == false))
                         || (typeid == 2 && (s.EventDate < DateTime.UtcNow && s.IsCancelled == false))
                         || (typeid == 3 && (s.IsCancelled == true))
                         || (typeid == 4 && (s.EventDate < DateTime.UtcNow && s.IsCancelled == false)
                                && !(from o in db.CateringReview
                                     select o.OrderId).Contains(s.ID))
                         orderby typeid != 2 ? s.EventDate : DateTime.UtcNow,
                                 typeid == 2 ? DateTime.UtcNow : s.EventDate descending
                         select s;

            return PartialView(orders.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult CreateReview()
        {
            return PartialView(new CateringReview { ID = 0, IsActive = true });
        }

        //Edit
        public ActionResult EditReview(int id)
        {
            CateringReview review = db.CateringReview.Find(id);
            return PartialView("CreateReview", review);
        }

        [HttpPost]
        public ActionResult CreateReview(CateringReview cateringReview)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (cateringReview.ID <= 0)
                    {
                        db.CateringReview.Add(cateringReview);
                    }
                    else
                    {
                        db.Entry(cateringReview).State = EntityState.Modified;
                    }
                    db.SaveChanges();
                    if (cateringReview.ID <= 0)
                    {
                        TempData["Success"] = "Review created successfully.";
                    }
                    else
                    {
                        TempData["Success"] = "Review updated successfully.";
                    }
                    return PartialView("CreateReview");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty,
                            ex.Message);
                }
            }
            return PartialView("CreateReview");
        }

        public ActionResult ReviewList(int? page)
        {
            pageNumber = (page ?? 1);

            var reviews = from s in db.CateringReview
                          orderby s.ID
                          select s;

            return PartialView(reviews.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ContactUs(int? page)
        {
            pageNumber = (page ?? 1);

            var queries = from s in db.ContactUs
                          where s.IsActive == true
                          orderby s.ID descending
                          select s;
            return PartialView(queries.ToPagedList(pageNumber, pageSize));
        }

    }
}
