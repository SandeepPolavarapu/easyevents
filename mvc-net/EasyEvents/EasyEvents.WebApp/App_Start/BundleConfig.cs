using System.Web.Optimization;

namespace EasyEvents.WebApp
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquerybootstrap").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/plugins/jquery-migrate-1.2.1.min.js",
                        "~/Scripts/jquery.unobtrusive*",  
                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/app.js"));

            bundles.Add(new StyleBundle("~/bundles/css").Include(
                        "~/Content/bootstrap.min.css",
                        "~/Content/font-awesome.min.css",
                        "~/Content/style.css",
                        "~/Content/app.css",
                        "~/Content/blue.css",
                        "~/Content/custom.css"));
        }
    }
}