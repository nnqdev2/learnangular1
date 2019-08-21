using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Models.Response
{
    public class ApUpdateSiteScoreResult
    {
        public int LustId { get; set; }
        public int CurrentSiteScore { get; set; }
        public string ErrorMessageHandler { get; set; }
    }
}
