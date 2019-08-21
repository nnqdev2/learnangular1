using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class HotcContact
    {
        [Key]
        public int AffilId { get; set; }
        public string ContactName { get; set; }
        public string Organization { get; set; }
        public string Address { get; set; }
        [Column("FNAME")]
        public string FirstName { get; set; }
        [Column("LNAME")]
        public string LastName { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        [Column("ZIP")]
        public string Zipcode { get; set; }
    }
}
