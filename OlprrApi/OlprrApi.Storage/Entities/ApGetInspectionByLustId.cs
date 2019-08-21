using System;

namespace OlprrApi.Storage.Entities
{
    public class ApGetInspectionByLustId
    {
        public int InspectionId { get; set; }
        public DateTime InspectionDate { get; set; }
        public string Inspector { get; set; }
        public string InspectorTypes { get; set; }
        public string Comment { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangedDate { get; set; }
        public string LogNumber { get; set; }
    }
}
