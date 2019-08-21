using System;
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class HotcSearchFilterResult
    {
        public string Type { get; set; }
        [Key]
        public int Id { get; set; }
        public string LogNumber { get; set; }
        public DateTime? FinalInvcRqstDate { get; set; }
        public DateTime? ClosedDate { get; set; }
        public string HotAddress { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string County { get; set; }
        public string Year { get; set; }
    }
}



