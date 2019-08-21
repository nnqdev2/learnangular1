using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class Inspection
    {
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
