using System;
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class Inspection
    {
        [Key]
        public int InspectionId { get; set; }
        public DateTime? InspectionDate { get; set; }
        public string Inspector { get; set; }
        public string InspectionTypes { get; set; }
        public string Comment { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
        public int LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
