using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    public class Context : DbContext
    {
        public Context(DbContextOptions<Context> options) : base(options) { }
        public virtual DbSet<Person> Persons { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductInCart> ProductInCarts { get; set; }
        public virtual DbSet<ProductInOrdered> ProductInOrdereds { get; set; }
        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<Ordered> Ordereds { get; set; }
        public virtual DbSet<Evaluation> Evaluations { get; set; }
    }
}
