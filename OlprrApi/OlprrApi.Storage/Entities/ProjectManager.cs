using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OlprrApi.Storage.Entities
{
    public class ProjectManageIncident
    {
        [Key]
        public string ProjectManagerCode { get; set; }
        public string ProjectManagerDescription { get; set; }
    }
}
