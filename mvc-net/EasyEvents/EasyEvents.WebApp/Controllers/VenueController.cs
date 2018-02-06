using EasyEvents.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace EasyEvents.WebApp.Controllers
{
    public class VenueController : Controller
    {
        private EasyEventContext db = new EasyEventContext();
        private const int defaultVenueCount =6;

        //
        // GET: /Venue/

        public ActionResult Index(string q, int? venueCount)
        {
            if (!venueCount.HasValue)
                venueCount = defaultVenueCount;

            ViewBag.q = q;
            //Retrieve the first page with a page size of entryCount 
            int totalItems;
            if (Request.IsAjaxRequest())
            {
                int page = venueCount.Value / defaultVenueCount;
                List<Venue> pagedVenues = GetVenues(q, page, defaultVenueCount, out totalItems);

                if (venueCount < totalItems)
                    AddMoreUrlToViewData(venueCount.Value, q,page,totalItems);

                return PartialView("_VenueList", pagedVenues);

            }

            List<Venue> venues = GetVenues(q, 1, venueCount.Value, out totalItems);

            if (venueCount < totalItems)
                AddMoreUrlToViewData(venueCount.Value, q,1,totalItems);

            return View(venues);
        }

        private List<Venue> GetVenues(string q, int page, int venueCount, out int totalItems)
        {
            List<Venue> venues = (from s in db.Venues
                                  where s.IsActive == true
                                  && (q == null || s.Name.ToUpper().Contains(q) || s.Address.ToUpper().Contains(q) || s.Area.ToUpper().Contains(q))
                                  select s).ToList();
            totalItems = venues.Count;

            return venues.OrderBy(s => s.Name).Skip((page - 1) * defaultVenueCount).Take(venueCount).ToList();
        }

        private void AddMoreUrlToViewData(int venueCount, string q,int page,int count)
        {
            ViewData["moreUrl"] = string.IsNullOrWhiteSpace(q) ? Url.Action("Index", "Venue", new { venueCount = venueCount + defaultVenueCount }) :
                Url.Action("Index", "Venue", new { q = q, venueCount = venueCount + defaultVenueCount });

            ViewData["remainingCount"] = count - page * defaultVenueCount;
        }

        public ActionResult Details(short id)
        {
            var venue = (from s in db.Venues
                         where s.ID == id
                         select s).Single();
            if (venue == null)
            {
                RedirectToAction("Error", "PageNotFound");
            }
            else
            {
                ViewBag.Title = venue.Name + "- Vijayawada";
            }            
            return View(venue);
        }

        public ActionResult Venues()
        {
            List<Venue> venues = (from s in db.Venues
                                  where s.IsActive == true && s.HasPhotos == true
                                  orderby Guid.NewGuid()
                                  select s).Take(3).ToList();

            return PartialView("~/Views/Shared/Venues.cshtml", venues);
        }

    }
}
