using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EasyEvents.WebApp.Models
{
    public class ContactUs
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required(ErrorMessage="Name is required")]
        [StringLength(20,MinimumLength=3)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter a valid e-mail adress")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Phone is required")]
        [RegularExpression(@"^(\d{10,12})$",ErrorMessage="Phone is not valid")]
        public string Phone { get; set; }

        [StringLength(500, MinimumLength = 10)]
        [Required(ErrorMessage = "Name is required")]
        public string Message { get; set; }

        public string QueryType { get; set; }

        public bool IsActive { get; set; }

        public DateTime DBCreatedUtc { get; set; }
    }
}