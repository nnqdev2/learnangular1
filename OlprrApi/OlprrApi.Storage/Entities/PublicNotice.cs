using System;
using System.ComponentModel.DataAnnotations;

namespace OlprrApi.Storage.Entities
{
    public class PublicNotice
    {
        [Key]
        public int PublicNoticeId { get; set; }
        public int PublicNoticeTypeId { get; set; }
        public string Description { get; set; }
        public DateTime? PublicNoticeDate { get; set; }
        public DateTime? MeetingDate { get; set; }
        public string Comment { get; set; }
        public Boolean MeetingRqstInd { get; set; }
        public string LastChangeBy { get; set; }
        public DateTime LastChangeDate { get; set; }
        public int LustId { get; set; }
        public string LogNumber { get; set; }
    }
}
