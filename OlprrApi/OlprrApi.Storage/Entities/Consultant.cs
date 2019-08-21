using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class Consultant
    {
        [Key]
        public int ConsultantId { get; set; }
        public string CompanyName { get; set; }
        public string Address { get; set; }

        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        [Column("EMAILADDRESS")]
        public string Email { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
    }
}
