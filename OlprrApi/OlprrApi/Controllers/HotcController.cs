using System;
using System.Collections.Generic;
using System.Linq;
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
    [Route("hotc")]
    public class HotcController : Controller
    {
        private readonly ILogger<HotcController> _logger;
        private readonly IHotcService _hotcService;
        public HotcController(ILogger<HotcController> logger, IHotcService hotcService)
        {
            _logger = logger;
            _hotcService = hotcService;
        }


        /// <summary>
        /// Search Hotc
        /// (apGetSearchHOTC_LUSTData)
        /// </summary>
        /// <param name="hotcSearchFilter">Search filters</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<HotcSearchFilterResultStats>))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("search")]
        [HttpPost]
        public async Task<IActionResult> Search([FromBody] Models.Request.HotcSearchFilter hotcSearchFilter) => Ok(await _hotcService.Search(hotcSearchFilter));

        /// <summary>
        /// Get Hotc Contacts
        /// (apGetHotcContacts)
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(IEnumerable<HotcContact>))]
        [Route("lust/{lustId}/contacts")]
        [HttpGet]
        public async Task<IActionResult> GetHotcContacts(int lustId) => Ok(await _hotcService.GetHotcContacts(lustId));

        /// <summary>
        /// ValidateLogNumberAndManagementData (get lust hotc data)
        /// (ApValidateLogNumberAndManagementData)
        /// </summary>
        /// <param name="lustId">lust id</param>
        [ProducesResponseType(200, Type = typeof(ApValidateLogNumberAndManagementData))]
        [Route("lusthotc/{lustId}")]
        [HttpGet]
        public async Task<IActionResult> GetLustHotc(int lustId)
        {
            return Ok(await _hotcService.ValidateLogNumberAndManagementData(lustId));
        }

        /// <summary>
        /// Insert/Update HOTC data for a LUST incident
        /// (ApInsUpdHotcLustData) 
        /// </summary>
        /// <param name="apInsUpdHotcLustData">lust hotc data for insert/update</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        [Route("lusthotc")]
        [HttpPost]
        public async Task<IActionResult> InsUpdHotcLustData([FromBody] Models.Request.ApInsUpdHotcLustData apInsUpdHotcLustData)
        {
            return Ok(await _hotcService.InsUpdHotcLustData(apInsUpdHotcLustData));
        }

        /// <summary>
        /// GetCleanDecommByHotIdData (get hotc data)
        /// (ApGetCleanDecommByHotIdData)
        /// </summary>
        /// <param name="hotId">hot id</param>
        [ProducesResponseType(200, Type = typeof(Models.Response.ApGetCleanDecommByHotIdData))]
        [Route("{hotId}")]
        [HttpGet]
        public async Task<IActionResult> GetHotc(int hotId)
        {
            return Ok(await _hotcService.GetCleanDecommByHotIdData(hotId));
        }

        /// <summary>
        /// Insert/Update HOTC data for a LUST incident
        /// (ApInsUpdHotcLustData) 
        /// </summary>
        /// <param name="apGetCleanDecommByHotIdData">hotc data for insert/update</param>
        [ProducesResponseType(200, Type = typeof(ApGenericResult))]
        [ProducesResponseType(400, Type = typeof(void))]
        //[Route()]
        [HttpPost]
        public async Task<IActionResult> InsUpdHotcCleanDecommData([FromBody] Models.Request.ApGetCleanDecommByHotIdData apGetCleanDecommByHotIdData)
        {
            return Ok(await _hotcService.InsUpdHotcCleanDecommData(apGetCleanDecommByHotIdData));
        }

        /// <summary>
        /// GetHotServiceProviderData (get hotc data)
        /// (ApGetHotServiceProviderData)
        /// </summary>
        /// <param name="licenseNbr">licenseNbr</param>
        [ProducesResponseType(200, Type = typeof(Models.Response.ServiceProvider))]
        [Route("serviceprovider/{licenseNbr}")]
        [HttpGet]
        public async Task<IActionResult> GetHotcServiceProvider(int licenseNbr)
        {
            return Ok(await _hotcService.GetHotServiceProviderData(licenseNbr));
        }
    }
}