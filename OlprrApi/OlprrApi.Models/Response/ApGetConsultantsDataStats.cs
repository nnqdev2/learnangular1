using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ApGetConsultantsDataStats
    {
        public string ReqCompanyName { get; set; }
        public string ReqAddress { get; set; }
        public string ReqCity { get; set; }
        public string ReqZipCode { get; set; }
        public int ReqPageNumber { get; set; }
        public int ReqRowsPerPage { get; set; }
        public int ReqSortColumn { get; set; }
        public int ReqSortOrder { get; set; }
        public int TotalRows { get; set; }
        public int TotalPages { get; set; }
        public int ConsultantId { get; set; }
        public string CompanyName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
    }
}
