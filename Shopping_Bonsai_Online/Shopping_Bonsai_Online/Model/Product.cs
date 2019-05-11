using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("Product")]
    public class Product
    {
        [Key]
        public int id { get; set; }
        [StringLength(50)]
        public string name { get; set; }
        public float price { get; set; }
        public byte type { get; set; }
        public byte status { get; set; }
        [StringLength(255)]
        public string producer { get; set; }
    }
}
