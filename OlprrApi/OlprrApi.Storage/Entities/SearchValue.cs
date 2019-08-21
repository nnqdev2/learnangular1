using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class SearchValue
    {
        [Key]
        [Column("Descript")]
        public string Value { get; set; }
    }
}
