using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using OlprrApi.Models.Request;
using OlprrApi.Models.Response;
using OlprrApi.Services;

namespace OlprrApi.Controllers
{
    //[EnableCors("AllowSpecificOrigin")]
    [EnableCors("AllowAllHeaders")]
    [Produces("application/json")]
    [Route("consultants")]
    public class ConsultantController : Controller
    {
        private readonly ILogger<LustController> _logger;
        private readonly ILustService _lustService;
        public ConsultantController(ILogger<LustController> logger, ILustService lustService)
        {
            _logger = logger;
            _lustService = lustService;
        }
        /// <summary>
        /// Search Consultants
        /// (apGetConsultantsData)
        /// </summary>
        /// <param name="consultantSearchFilter">Search filters</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<ApGetConsultantsDataStats>))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("search")]
        [HttpPost]
        public async Task<IActionResult> Search([FromBody] Models.Request.ConsultantSearchFilter consultantSearchFilter) => Ok(await _lustService.Search(consultantSearchFilter));

        /// <summary>
        /// Insert/Update consultant
        /// (InsUpdConsultantData) 
        /// </summary>
        /// <param name="consultant">consultant data</param>
        [ProducesResponseType(200, Type = typeof(ApConsultantResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("")]
        [HttpPost]
        public async Task<IActionResult> PostConsultantData([FromBody] Models.Request.Consultant consultant)
        {
            return Ok(await _lustService.InsUpdConsultantData(consultant));
        }

        /// <summary>
        /// Get consultant data
        /// (ApConsultantByIdData) 
        /// </summary>
        /// <param name="consultantid">consultant id</param>
        [ProducesResponseType(200, Type = typeof(Models.Response.Consultant))]
        [ProducesResponseType(404, Type = typeof(void))]
        [Route("{consultantid}")]
        [HttpGet]
        public async Task<IActionResult> GetConsultantByIdData(int consultantid)
        {
            return Ok(await _lustService.GetConsultantByIdData(consultantid));
        }
        /// <summary>
        /// Delete a consultant
        /// (ApDltConsultantData)
        /// </summary>
        /// <param name="consultantId">consultantId</param>
        [ProducesResponseType(200, Type = typeof(ApConsultantResult))]
        [Route("{consultantId}")]
        [HttpDelete]
        public async Task<IActionResult> DeleteConsultant(int consultantId)
        {
            return Ok(await _lustService.DltConsultantData(consultantId));
        }
    }
}
