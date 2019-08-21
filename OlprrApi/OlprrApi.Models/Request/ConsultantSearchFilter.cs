using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ConsultantSearchFilter
    {
        public string CompanyName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public int SortColumn { get; set; }
        public int SortOrder { get; set; }
        public int PageNumber { get; set; }
        public int RowsPerPage { get; set; }
    }
}
