using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApLustCris
    {
        [Key]
        public int LustId { get; set; }
        public int CrisExists { get; set; }
    }
}
