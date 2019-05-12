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
        public virtual DbSet<Person> persons { get; set; }
        public virtual DbSet<Product> products { get; set; }
        public virtual DbSet<ProductInCart> productInCarts { get; set; }
        public virtual DbSet<ProductInOrdered> productInOrdereds { get; set; }
        public virtual DbSet<Cart> carts { get; set; }
        public virtual DbSet<Ordered> ordereds { get; set; }
        public virtual DbSet<Evaluation> evaluations { get; set; }
    }
}
