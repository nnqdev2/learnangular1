using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using LogService;
using Microsoft.Extensions.Options;
using Models.Requests;
using Microsoft.Extensions.Logging;

namespace Logging.Controllers
{

    [Produces("application/json")]
    
    public class LoggingController : Controller
    {

        private readonly ILogger _logger;
        private readonly ILogger<LoggingController> _fileLogger;

        
        LogService.AppSettings appSettings = new LogService.AppSettings();

        public LoggingController(IOptions<AppSettings> _settings, ILogger<LoggingController> logger, ILogger<LoggingController> fileLogger)
        {
            _fileLogger = logger;
            _logger = logger;
            appSettings.Extension = _settings.Value.Extension;
            appSettings.FolderPath = _settings.Value.FolderPath;
            appSettings.FileName = _settings.Value.FileName;
            appSettings.FileRespositoryLocation = _settings.Value.FileRespositoryLocation;
            


        }

        [Route("Logging/LogEvent/LUST")]
        [ActionName("LogEvent")]
        public async Task<IActionResult> LogEventLUST([FromBody]  Models.Requests.LogData logData)
        {

            logData.routeName = Request.Path.Value;
            

            string cnString = "Server = DEQSQL2\\Dev;UID=LUSTUser;PWD=onEwhol3trY%$;Database=LUST";

            var result = await LogServices.AddExceptionLogAsync(logData, cnString, appSettings, _logger);
            if (result == true)
                return Ok();
            else
                return NotFound();

        }

        [Route("Logging/LogEvent/CRIS")]
        [ActionName("LogEvent")]
        public async Task<IActionResult> LogEventCRIS([FromBody]  Models.Requests.LogData logData)
        {

            logData.routeName = Request.Path.Value;
            string cnString = "Server = DEQSQL2\\DEV;database=CRIS;Integrated Security=SSPI;Connect Timeout = 30";
            

            var result = await LogServices.AddExceptionLogAsync(logData, cnString, appSettings, _logger);
            if (result == true)
                return Ok();
            else
                return NotFound();

        }

        [Route("Logging/LogEvent/ACES")]
        [ActionName("LogEvent")]
        public async Task<IActionResult> LogEventACES([FromBody]  Models.Requests.LogData logData)
        {

            try {
                _fileLogger.LogInformation("TEST", new object { });
            }
            catch (Exception ex)
            {
                _logger.LogError(LoggingEvents.Normal, ex.InnerException + "\n" + ex.Message);
            }
            _logger.LogDebug(LoggingEvents.Normal, "Writing ACES Log Message");
            logData.routeName = Request.Path.Value;
            string cnString = "Server = DEQSQL2\\DEV;database=CRIS;Integrated Security=SSPI;Connect Timeout = 30";


            var result = await LogServices.AddExceptionLogAsync(logData, cnString, appSettings, _logger);
            if (result == true)
                return Ok();
                
            else
            {
                return NotFound();
            }
        }


        [Route("Logging/GetEvents/CRIS")]
        [ActionName("GetEvent")]
        public async Task<List<LogData>> GetEventACES([FromBody]  Models.Requests.LogData logData)
        {
            List<LogData> logReturnData = new List<LogData>();

            logData.routeName = Request.Path.Value;
            string cnString = "Server = DEQSQL2\\DEV;database=CRIS;Integrated Security=SSPI;Connect Timeout = 30";


            var result = await LogServices.AddExceptionLogAsync(logData, cnString, appSettings, _logger);
            if (result == true)
                return logReturnData;
            else
                return null;

        }


        //// GET api/values
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/values/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/values
        //[HttpPost]
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT api/values/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE api/values/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}


    }
}
