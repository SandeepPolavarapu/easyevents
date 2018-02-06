using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EasyEvents.WebApp.Models
{
    public class CateringReview
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [StringLength(20, MinimumLength = 3)]
        public string DisplayName { get; set; }

        [Required]
        [ForeignKey("CateringOrder")]
        public int OrderId { get; set; }

        [Required]
        [Range(1,5)]
        public byte Rating { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 10)]
        public string Review { get; set; }

        [Required]
        public bool IsActive { get; set; }

        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Computed)]
        public DateTime DbCreatedUtc { get;set; }

        public virtual CateringOrder CateringOrder { get; set; }
    }
}