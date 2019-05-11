using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("Person")]
    public class Person
    {
        [Key]
        public int id { get; set; }
        [StringLength(255)]
        public string firstName { get; set; }
        [StringLength(255)]
        public string lastName { get; set; }
        [StringLength(50)]
        public string phone { get; set; }
        [StringLength(255)]
        public string email { get; set; }
        [StringLength(255)]
        public string address { get; set; }
        [StringLength(255)]
        public string username { get; set; }
        [StringLength(1000)]
        public string password { get; set; }
        public byte isAdmin { get; set; }
    }
}
