export interface HotcSearchResultStat {
    reqSortColumn?: number;
    reqSortOrder?: number;
    reqPageNumber?: number;
    reqRowsPerPage?: number;
    totalRows?: number;
    totalPages?: number;
    result?: number;
    searchType: string;
    id: number;
    logNumber: string;
    finalInvRqstDate?: Date;
    closedDate?: Date;
    hotAddress: string;
    city: string;
    zipCode: string;
    county: string;
    year?: number;
}
