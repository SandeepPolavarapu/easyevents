using EasyEvents.WebApp.Models;
using PagedList;
using System;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;

namespace EasyEvents.WebApp.Controllers
{
    public class ContactController : Controller
    {
        private EasyEventContext db = new EasyEventContext();

        //
        // GET: /Contact/
        [HttpGet]
        public ActionResult Index()
        {
            var model = new ContactUs();
            if (!string.IsNullOrEmpty(Request.QueryString["bid"]))
            {
                model.Message = "Booking package-" + Request.QueryString["bid"].ToString();
                model.QueryType = "Book";
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["cid"]))
            {
                model.Message = "Customizing package-" + Request.QueryString["cid"].ToString();
                model.QueryType = "Customize";
            }
            else
            {
                model.Message = "";
                model.QueryType = "Query";
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ContactUs contactUs)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    contactUs.IsActive = true;
                    contactUs.DBCreatedUtc = System.DateTime.UtcNow;
                    db.ContactUs.Add(contactUs);
                    db.SaveChanges();
                    TempData["Success"] = "Thank you for writing to us. Our representative will get in touch with you soon.";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty,
                            "An error occured - please try after sometime");
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult Details(Guid id, int? page)
        {
            id = Guid.Parse(Request.QueryString["id"]);
            Guid key = new Guid(ConfigurationManager.AppSettings["ContactKey"]);
            if (id == key)
            {
                int pageSize = 10;
                int pageNumber = (page ?? 1);

                var queries = from s in db.ContactUs
                              where s.IsActive == true
                              orderby s.ID descending
                              select s;
                return View(queries.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Error", "PageNotFound");
            }
        }


    }
}
