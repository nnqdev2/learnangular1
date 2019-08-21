using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class LookUp
    {
        [Key]
        public int Id { get; set; }
        public string DataType { get; set; }
        
        public string CodeValue { get; set; }
        public string NameValue { get; set; }
    }
}
