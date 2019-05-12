using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("ProductInCart")]
    public class ProductInCart
    {
        [Key]
        public int id { get; set; }
        public int productRefId { get; set; }
        public int cartRefId { get; set; }
        public int count { get; set; }
        public float totalPrice { get; set; }
        [ForeignKey("productRefId")]
        public virtual Product Product { get; set; }
        [ForeignKey("cartRefId")]
        public virtual Cart Cart { get; set; }
    }
}
