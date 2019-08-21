using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class HotcContact
    {
        public int AffilId { get; set; }
        public string ContactName { get; set; }
        public string Organization { get; set; }
        public string Address { get; set; }
        public string FirstName { get; set; }

        public string LastName { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zipcode { get; set; }
    }
}
