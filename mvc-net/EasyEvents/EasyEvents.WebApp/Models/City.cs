using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EasyEvents.WebApp.Models
{
    public class City
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public byte ID { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        public bool PartnerOnly { get; set; }

        [Required]
        public bool IsActive { get; set; }
    }
}