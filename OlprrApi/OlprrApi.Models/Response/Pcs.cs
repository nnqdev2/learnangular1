using System;

namespace OlprrApi.Models.Response
{
    public class Pcs
    {
        public int PcsId { get; set; }
        public int? DispLandfillFacId { get; set; }
        public int? DispThrmFacId { get; set; }
        public Boolean? OnSiteDisposalInd { get; set; }
        public string OffSiteDispAddr { get; set; }
        public int? SoilStatusId { get; set; }
        public string SoilStatusCode { get; set; }
        public decimal? LandfillAmtYrds3 { get; set; }
        public decimal? ThermalAmtYrds3 { get; set; }
        public decimal? OnSiteAmtYrds3 { get; set; }
        public decimal? OffSiteAmtYrds3 { get; set; }
        public DateTime? DisposalDate { get; set; }
        public string PcsComment { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime? LastChangeDate { get; set; }
        public int LustId { get; set; }
        public string LogNumber { get; set; }
        public string SwlaPermitNbr { get; set; }
    }
}
