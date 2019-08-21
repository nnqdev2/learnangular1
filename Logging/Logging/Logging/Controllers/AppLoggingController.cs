using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Logging.Controllers
{
    [Produces("application/json")]
    [Route("api/AppLogging")]
    public class AppLoggingController : Controller
    {
        private readonly ILogger _logger;

        public AppLoggingController()
        {

        }

    }
}