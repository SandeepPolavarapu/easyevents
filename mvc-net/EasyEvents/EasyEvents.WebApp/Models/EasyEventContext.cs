using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace EasyEvents.WebApp.Models
{
    public class EasyEventContext : DbContext
    {
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //manual mapping from entity to table
            //modelBuilder.Entity<Item>().ToTable("Item");
        }

        public EasyEventContext():base("easyevent")
        {
        }
        public DbSet<City> Cities { get; set; }

        public DbSet<Category> Categories { get; set; }
        public DbSet<CatererMasterMenu> CatererMasterMenus { get; set; }
        public DbSet<CatererPackage> CatererPackages { get; set; }
        public DbSet<CatererPackageMenu> CatererPackageMenus { get; set; }
        public DbSet<Cuisine> Cuisines { get; set; }

        public DbSet<Venue> Venues { get; set; }

        public DbSet<ContactUs> ContactUs { get; set; }
        public DbSet<CateringOrder> CateringOrder { get; set; }
        public DbSet<CateringReview> CateringReview { get; set; }
    }
}