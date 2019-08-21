using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace OlprrApi.Models.Request
{
    public class ApInsUpdPublicNoticeData
    {
        public int PublicNoticeId { get; set; }
        public int LustId { get; set; }
        public int PublicNoticeTypeId { get; set; }
        public DateTime? PublicNoticeDate { get; set; }
        public Boolean MeetingRqstInd { get; set; }
        public DateTime? MeetingDate { get; set; }
        [MaxLength(8000)]
        public string Comment { get; set; }
        public string LastChangeBy { get; set; }
    }
}
