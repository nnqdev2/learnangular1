using Microsoft.EntityFrameworkCore;
using OlprrApi.Storage.Entities;

namespace OlprrApi.Storage
{
    public class LustDbContext : DbContext
    {
        public DbSet<ConfirmationType> ConfirmationType { get; set; }
        public DbSet<County> County { get; set; }
        public DbSet<DiscoveryType> DiscoveryType { get; set; }
        public DbSet<QuadrantT> QuadrantT { get; set; }
        public DbSet<ReleaseCauseType> ReleaseCauseType { get; set; }
        public DbSet<SiteTypeT> SiteTypeT { get; set; }
        public DbSet<SourceType> SourceType { get; set; }
        public DbSet<State> State { get; set; }
        public DbSet<StreetTypeT> StreetTypeT { get; set; }
        public DbSet<DeqOfficeT> DeqOfficeT { get; set; }
        public DbSet<IncidentStatusT> IncidentStatusT { get; set; }
        public DbSet<City> City { get; set; }
        public DbSet<FileStatus> FileStatus { get; set; }
        public DbSet<TankStatus> TankStatus { get; set; }
        public DbSet<ZipCode> ZipCode { get; set; }
        public DbSet<CleanupSiteType> CleanupSiteType { get; set; }
        public DbSet<DateCompare> DateCompare { get; set; }
        public DbSet<Region> Region { get; set; }
        public DbSet<ProjectManageIncident> ProjectManager { get; set; }
        public DbSet<SiteType2> SiteType2 { get; set; }
        public DbSet<Brownfield> Brownfield { get; set; }
        public DbSet<ContactType> ContactType { get; set; }
        public DbSet<LookUp> LookUp { get; set; }
        public DbSet<ApGetLookupTablesByType> ApGetLookupTablesByType { get; set; }
        public DbSet<ApGetLookupTablesByType2> ApGetLookupTablesByType2 { get; set; }

        public DbSet<ApOlprrGetLustLookup> ApOLPRRGetLustLookup { get; set; }
        public DbSet<ApGetLustSearchData> ApGetLustSearchData { get; set; }
        public DbSet<ApOlprrGetUstLookupData> ApOlprrGetUstLookupData { get; set; }

        public DbSet<ApOlprrInsertIncident> ApOLPRRInsertIncident { get; set; }
        public DbSet<ApOlprrGetIncidentById> ApOlprrGetIncidentById { get; set; }
        public DbSet<ApOlprrGetIncidents> ApOlprrGetIncidents { get; set; }
        public DbSet<ApOlprrGetIncidentDataById> ApOlprrGetIncidentDataById { get; set; }

        public DbSet<ApGetPartyGridByLustId> ApGetPartyGridByLustId { get; set; }
        public DbSet<ApGetSiteAliasByLustId> ApGetSiteAliasByLustId { get; set; }
        public DbSet<ApGetSiteAliasByLustId2> ApGetSiteAliasByLustId2 { get; set; }
        public DbSet<Contact> Contact { get; set; }
        public DbSet<LustIncident> LustIncident { get; set; }
        public DbSet<ProjectManagerIncident> ProjectManagerIncident { get; set; }
        public DbSet<ApGetLogNumber> ApGetLogNumber { get; set; }
        public DbSet<ApGetAffilById> ApGetAffilById { get; set; }
        public DbSet<ApGetAssessmentSiteScoreValuesByLustId> ApGetAssessmentSiteScoreValuesByLustId { get; set; }
        public DbSet<ApGetScoringRangeData> ApGetScoringRangeData { get; set; }
        public DbSet<ApGetScoringValuesByLustIdData> ApGetScoringValuesByLustIdData { get; set; }
        public DbSet<Consultant> Consultant { get; set; }
        public DbSet<ApGetImageByLustIdData> ApGetImageByLustIdData { get; set; }
        public DbSet<ApGetImageByIdData> ApGetImageByIdData { get; set; }

        public DbSet<ApGetWorkReportedByLustIdData> ApGetWorkReportedByLustIdData { get; set; }

        public DbSet<ProjectManagerHistory> ProjectManagerHistory { get; set; }
        public DbSet<PublicNotice> PublicNotice { get; set; }
        public DbSet<Inspection> Inspection { get; set; }
        public DbSet<SearchValue> SearchValue { get; set; }
        public DbSet<PcsPcsPermit> ApGetPcsByLustIdData { get; set; }
        public DbSet<Pcs> ApGetPcsByPcsIdData { get; set; }
        public DbSet<PcsPermit> ApGetPcsPermitByPcsIdData { get; set; }
        public DbSet<ApGetAssessmentSiteScoreValuesRangesByLustId> ApGetAssessmentSiteScoreValuesRangesByLustId { get; set; }
        public DbSet<SiteControl> SiteControl { get; set; }
        public DbSet<HotcSearchFilterResult> HotcSearchFilterResult { get; set; }
        public DbSet<HotcContact> HotcContact { get; set; }
        public DbSet<ApValidateLogNumberAndManagementData> ApValidateLogNumberAndManagementData { get; set; }
        public DbSet<ApGetCleanDecommByHotIdData> ApGetCleanDecommByHotIdData { get; set; }
        public DbSet<ServiceProvider> ServiceProvider { get; set; }
        public DbSet<ApLustCris> ApLustCris { get; set; }
        public DbSet<ActiveProjectManager> ActiveProjectManager { get; set; }

        public LustDbContext(DbContextOptions<LustDbContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}