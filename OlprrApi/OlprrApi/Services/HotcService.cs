using System.Threading.Tasks;
using AutoMapper;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using OlprrApi.Storage.Repositories;
using RequestDto = OlprrApi.Models.Request;
using ResponseDto = OlprrApi.Models.Response;
using EntityDto = OlprrApi.Storage.Entities;
using System.Text;
using OlprrApi.Models.Response;

namespace OlprrApi.Services
{
    public class HotcService : IHotcService
    {
        private ILogger<HotcService> _logger;
        private IHotcRepository _hotcRepository;
        private readonly IMapper _mapper;
        public HotcService(ILogger<HotcService> logger, IHotcRepository hotcRepository, IMapper mapper)
        {
            _logger = logger;
            _hotcRepository = hotcRepository;
            _mapper = mapper;
        }
        public async Task<IEnumerable<HotcSearchFilterResultStats>> Search(RequestDto.HotcSearchFilter hotcSearchFilter)
        {
            var searchFilters = _mapper.Map<RequestDto.HotcSearchFilter, EntityDto.HotcSearchFilter>(hotcSearchFilter);
            var resultList = new List<ResponseDto.HotcSearchFilterResultStats>();
            foreach (var result in await _hotcRepository.ApGetHotcData(searchFilters))
            {
                resultList.Add(_mapper.Map<EntityDto.HotcSearchFilterResultStats, ResponseDto.HotcSearchFilterResultStats>(result));
            }
            return resultList;
        }
        public async Task<IEnumerable<HotcContact>> GetHotcContacts(int lustId)
        {
            var resultList = new List<ResponseDto.HotcContact>();
            foreach (var result in await _hotcRepository.ApGetHotcContacts(lustId))
            {
                resultList.Add(_mapper.Map<EntityDto.HotcContact, ResponseDto.HotcContact>(result));
            }
            return resultList;
        }
        public async Task<ApValidateLogNumberAndManagementData> ValidateLogNumberAndManagementData(int lustId)
        {
            var result = await _hotcRepository.ApValidateLogNumberAndManagementData(lustId);
            return (_mapper.Map<EntityDto.ApValidateLogNumberAndManagementData, ResponseDto.ApValidateLogNumberAndManagementData>(result));
        }

        public async Task<ApGenericResult> InsUpdHotcLustData(RequestDto.ApInsUpdHotcLustData apInsUpdHotcLustData)
        {
            var data = _mapper.Map<RequestDto.ApInsUpdHotcLustData, EntityDto.ApInsUpdHotcLustData>(apInsUpdHotcLustData);
            var result = await _hotcRepository.ApInsUpdHotcLustData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ApGetCleanDecommByHotIdData> GetCleanDecommByHotIdData(int hotId)
        {
            var result = await _hotcRepository.ApGetCleanDecommByHotIdData(hotId);
            return (_mapper.Map<EntityDto.ApGetCleanDecommByHotIdData, ResponseDto.ApGetCleanDecommByHotIdData>(result));
        }

        public async Task<ApGenericResult> InsUpdHotcCleanDecommData(RequestDto.ApGetCleanDecommByHotIdData apGetCleanDecommByHotIdData)
        {
            var data = _mapper.Map<RequestDto.ApGetCleanDecommByHotIdData, EntityDto.ApGetCleanDecommByHotIdData>(apGetCleanDecommByHotIdData);
            var result = await _hotcRepository.ApInsUpdHotcCleanDecommData(data);
            return _mapper.Map<EntityDto.ApGenericResult, ResponseDto.ApGenericResult>(result);
        }

        public async Task<ServiceProvider> GetHotServiceProviderData(int licenseNbr)
        {
            var result = await _hotcRepository.ApGetHotServiceProviderData(licenseNbr);
            return (_mapper.Map<EntityDto.ServiceProvider, ResponseDto.ServiceProvider>(result));
        }
    }
}
