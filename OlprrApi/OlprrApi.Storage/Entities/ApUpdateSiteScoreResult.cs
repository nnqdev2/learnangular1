using System;
using System.Collections.Generic;
using System.Text;

namespace OlprrApi.Storage.Entities
{
    public class ApUpdateSiteScoreResult
    {
        public int LustId { get; set; }
        public int CurrentSiteScore { get; set; }
        public string ErrorMessageHandler { get; set; }
    }
}
