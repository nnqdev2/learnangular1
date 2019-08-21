using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace OlprrApi.Models.Request
{
    public class Consultant
    {
        [DefaultValue(0)]
        public int? ConsultantId { get; set; }
        [Required]
        public string CompanyName { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string ZipCode { get; set; }
        [Required]
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string LastChangeBy { get; set; }
        //public DateTime? LastChangeDate { get; set; }
    }
}
