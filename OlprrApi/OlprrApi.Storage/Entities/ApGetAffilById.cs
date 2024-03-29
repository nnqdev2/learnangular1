﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OlprrApi.Storage.Entities
{
    public class ApGetAffilById
    {
        [Key]
        public int AffilId { get; set; }
        public string AffilTypeCd { get; set; }
        public string AffilTypeDesc { get; set; }
        public DateTime? StartDt { get; set; }
        public DateTime? EndDt { get; set; }
        //[Column("PartyID")]
        public int? PartyId  { get; set; }
        public string Organization { get; set; }
        public string SubOrganization { get; set; }
        public string JobTitle { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        //[Column("ZIP")]
        public string Zip { get; set; }
        public string Country { get; set; }
        public string AffilComments { get; set; }
        public string LastUpdBy { get; set; }
        public DateTime? LastUpdDttm { get; set; }
        //[Column("ZP4Checked")]
        public int? Zp4Checked { get; set; }
        public int LustId { get; set; }
        public int? CrisCheck { get; set; } = 0;
        public string LogNumber { get; set; }
        public string ReleaseType { get; set; }
    }
}
