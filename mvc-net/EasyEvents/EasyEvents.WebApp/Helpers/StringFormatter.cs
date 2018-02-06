using System.Globalization;

namespace EasyEvents.WebApp.Helpers
{
    public static class StringFormatter
    {
        public static string NumberFormatter(int val)
        {
            CultureInfo india = new CultureInfo("en-IN");
            string text = string.Format(india, "{0:#,#}", val);
            return text;
        }

        public static string PriceFormatter(decimal val)
        {
            CultureInfo india = new CultureInfo("en-IN");
            string text = string.Format(india, "{0:#,#}", val);
            return text.Substring(0);
        }
    }
}