﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("ProductInOrdered")]
    public class ProductInOrdered
    {
        [Key]
        public int id { get; set; }
        public int productRefId { get; set; }
        public int orderedRefId { get; set; }
        public int count { get; set; }
        public float totalPrice { get; set; }
        [ForeignKey("productRefId")]
        public virtual Product Product { get; set; }
        [ForeignKey("orderedRefId")]
        public virtual Ordered Ordered { get; set; }
    }
}
