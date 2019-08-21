using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class HotcSearchFilterResultStats
    {
        public int ReqSortColumn { get; set; }
        public int ReqSortOrder { get; set; }
        public int ReqPageNumber { get; set; }
        public int ReqRowsPerPage { get; set; }
        public int TotalRows { get; set; }
        public int TotalPages { get; set; }
        public int Result { get; set; }
        public string SearchType { get; set; }
        public int Id { get; set; }
        public string LogNumber { get; set; }
        public DateTime? FinalInvRqstDate { get; set; }
        public DateTime? ClosedDate { get; set; }
        public string HotAddress { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string County { get; set; }
        public int? Year { get; set; }
        //public string ReqId { get; set; }
        //public string ReqStreetNbr { get; set; }
        //public string ReqStreetQuad { get; set; }
        //public string ReqStreetName { get; set; }
        //public string ReqStreetType { get; set; }
        //public string ReqOtherAddr { get; set; }
        //public string ReqCity { get; set; }
        //public string ReqZipCode { get; set; }
        //public string ReqCounty { get; set; }
        //public string ReqYear { get; set; }
        //public string ReqSearchType { get; set; }
        //public DateTime? ReqFinalInvRqstDate { get; set; }
        //public DateTime? ReqClosedDate { get; set; }
    }
}
