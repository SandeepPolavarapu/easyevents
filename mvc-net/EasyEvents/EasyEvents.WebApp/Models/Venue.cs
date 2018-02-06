using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EasyEvents.WebApp.Models
{
    public class Venue
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public short ID { get; set; }

        [Required]
        [StringLength(200, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [StringLength(500, MinimumLength = 3)]
        public string Address { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 3)]
        public string Area { get; set; }

        [Required]
        [RegularExpression("[0-9]{6}", ErrorMessage = "Invalid Pincode")]
        public string Pincode { get; set; }

        [Required]
        public byte CityId { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 10)]
        public string Phone { get; set; }

        public string Latitude { get; set; }

        public string Longitude { get; set; }

        [Required]
        public decimal Rent { get; set; }

        [Required]
        public short Capacity { get; set; }

        [Required]
        public bool IsAirConditioned { get; set; }

        [Required]
        public bool HasPhotos { get; set; }

        [Required]
        public bool IsActive { get; set; }

        public virtual City City { get; set; }
    }
}