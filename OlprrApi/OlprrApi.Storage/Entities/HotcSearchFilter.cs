using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class HotcSearchFilter
    {
        public int? Id { get; set; }
        public string StreetNbr { get; set; }
        public string StreetQuad { get; set; }
        public string StreetName { get; set; }
        public string StreetType { get; set; }
        public string OtherAddr { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string County { get; set; }
        public string Year { get; set; }
        public int? SearchType { get; set; } = 3;
        public DateTime? FinalInvRqstDate { get; set; }
        public DateTime? ClosedDate { get; set; }
        public int SortColumn { get; set; }
        public int SortOrder { get; set; }
        public int PageNumber { get; set; }
        public int RowsPerPage { get; set; }
    }
}










