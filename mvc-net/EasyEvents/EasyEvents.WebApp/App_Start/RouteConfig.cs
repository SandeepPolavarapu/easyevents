using System.Web.Mvc;
using System.Web.Routing;

namespace EasyEvents.WebApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               name: "ErrorContact",
               url: "{controller}/{action}",
               defaults: new { action = "Index" },
               constraints: new { controller = "Error|Contact|Manage|Review" }
            );

            routes.MapRoute(
                name: "VenueDetail",
                url: "{city}/Venue/{id}/{name}",
                defaults: new { city = "Vijayawada", controller = "Venue", action = "Details" },
                constraints: new { id = @"\d+" }
            );

            routes.MapRoute(
                name: "PackageDetail",
                url: "{city}/Catering/Package-{id}",
                defaults: new { city = "Vijayawada", controller = "Catering", action = "PackageDetails" },
                constraints: new { id = @"\d+" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{city}/{controller}/{action}/{id}",
                defaults: new { city = "Vijayawada", controller = "Home", action = "Index", id = UrlParameter.Optional }
            );           
        }
    }
}