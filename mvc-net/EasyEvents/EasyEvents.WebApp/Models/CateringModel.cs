using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace EasyEvents.WebApp.Models
{
    public class CateringModel
    {
    }

    public class CateringPackage
    {
        public short Id { get; set; }

        public string Name { get; set; }

        public decimal Price { get; set; }

        public short MinPerson { get; set; }

        public byte ItemsCount { get; set; }

        public byte RemainingCategoryCount { get; set; }

        public List<Tuple<byte, string, string[]>> Menu { get; set; }

        public List<CateringReview> Reviews { get; set; }
    }

    public class Category
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public byte ID { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string PluralName { get; set; }
    }

    public class CatererMasterMenu
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        public byte CategoryId { get; set; }

        [Required]
        public byte PartnerId { get; set; }

        [Required]
        public bool IsActive { get; set; }

        public virtual Category Category { get; set; }
    }

    public class CatererPackage
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        [Column("Id")]
        public short PackageId { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        public byte PartnerId { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        public short MinPerson { get; set; }

        [Required]
        public byte ItemsCount { get; set; }

        [Required]
        public bool IsVeg { get; set; }

        [Required]
        public bool IsActive { get; set; }

        [Required]
        public virtual CatererPackageMenu CatererPackageMenu { get; set; }
    }

    public class CatererPackageMenu
    {
        [Key]
        [ForeignKey("CatererPackage")]
        public short PackageId { get; set; }

        [Required]
        public string PackageXML { get; set; }

        public virtual CatererPackage CatererPackage { get; set; }
    }


    public class Cuisine
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public byte ID { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }
    }
}