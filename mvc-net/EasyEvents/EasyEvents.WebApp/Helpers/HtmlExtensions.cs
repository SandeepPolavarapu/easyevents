using System;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace EasyEvents.WebApp.Helpers
{
    public static class HtmlExtensions
    {
        public static MvcHtmlString MenuItem(this HtmlHelper htmlHelper, string text, string action, string controller, bool isSubMenu = false)
        {
            var li = new TagBuilder("li");
            var routeData = htmlHelper.ViewContext.RouteData;
            var currentController = routeData.GetRequiredString("controller");
            if (isSubMenu)
            {
                var currentAction = routeData.GetRequiredString("action");
                if (string.Equals(currentAction, action, StringComparison.OrdinalIgnoreCase) && string.Equals(currentController, controller, StringComparison.OrdinalIgnoreCase))
                {
                    li.AddCssClass("active");
                }
            }
            else
            {                
                if (string.Equals(currentController, controller, StringComparison.OrdinalIgnoreCase))
                {
                    li.AddCssClass("active");
                }
            }
            li.InnerHtml = htmlHelper.ActionLink(text, action, controller).ToHtmlString();
            return MvcHtmlString.Create(li.ToString());
        }

        public static string GetLayout(this HtmlHelper htmlHelper)
        {
            var action = htmlHelper.ViewContext.RouteData.GetRequiredString("controller");
            if (string.Equals("manage", action, StringComparison.OrdinalIgnoreCase))
            {
                return "~/Views/Shared/_Manage.cshtml";
            }
            return "~/Views/Shared/_Layout.cshtml";
        }

        public static string MakeActiveClass(this UrlHelper urlHelper, string controller)
        {
            string result = "active";

            string controllerName = urlHelper.RequestContext.RouteData.Values["controller"].ToString();

            if (!controllerName.Equals(controller, StringComparison.OrdinalIgnoreCase))
            {
                result = null;
            }

            return result;
        }
    }
}