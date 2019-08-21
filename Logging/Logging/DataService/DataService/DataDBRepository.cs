using DataService.DTO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace DataService
{
    public class DataDBRepository : IStoreRepository
    {



        private readonly IConfiguration config;

        public DataDBRepository(IConfiguration _config)
        {
            config = _config;
        }
        public async Task<Boolean> AddExceptionLog(logDataDTO logData, string cnString, appSettingsDTO appSettings)
        {
            bool rtn = false;

            using (SqlConnection conn = new SqlConnection(cnString))
            {
                string sql = "apInsExceptionLog";
                using (SqlCommand com = new SqlCommand(sql, conn))
                {
                    com.Parameters.AddWithValue("@MachineName", logData.machineName);
                    com.Parameters.AddWithValue("@WindowsIdentity", logData.identity);
                    com.Parameters.AddWithValue("@Type", logData.typeMsg);
                    com.Parameters.AddWithValue("@Message", logData.message);
                    com.Parameters.AddWithValue("@Source", logData.source);
                    com.Parameters.AddWithValue("@TargetSite", logData.targetSite);
                    com.Parameters.AddWithValue("@Details", logData.details);
                    conn.Open();
                    com.CommandType = System.Data.CommandType.StoredProcedure;
                    try
                    {
                        com.ExecuteNonQuery();
                        rtn = true;
                    }
                    catch
                    {
                        rtn = false;
                    }
                }
            }
            await Task.CompletedTask;
            return rtn;

        }




    }
}
