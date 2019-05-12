using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Model
{
    [Table("Evaluation")]
    public class Evaluation
    {
        [Key]
        public int id { get; set; }
        public int personRefId { get; set; }
        public string title { get; set; }
        public string message { get; set; }
        [ForeignKey("personRefId")]
        public virtual Person Person { get; set; }
    }
}
