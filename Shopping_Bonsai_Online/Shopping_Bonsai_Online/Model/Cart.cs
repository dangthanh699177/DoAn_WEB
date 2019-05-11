using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("Cart")]
    public class Cart
    {
        [Key]
        public int id { get; set; }
        public int productRefId { get; set; }
        public int productInCartRefId { get; set; }
        public float totalPrice { get; set; }
        [ForeignKey("productRefId")]
        public virtual Product Product { get; set; }
        [ForeignKey("productInCartRefId")]
        public virtual ProductInCart ProductInCart { get; set; }
    }
}
