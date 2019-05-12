using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("Ordered")]
    public class Ordered
    {
        [Key]
        public int id { get; set; }
        public int productRefId { get; set; }
        public DateTime dateOfBought { get; set; }
        public float totalPrice { get; set; }
        public byte status { get; set; }
        [ForeignKey("productRefId")]
        public virtual Product Product { get; set; }
    }
}
