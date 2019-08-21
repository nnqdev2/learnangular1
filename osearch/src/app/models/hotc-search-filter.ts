export interface HotcSearchFilter {
    id?: number;
    streetNbr?: string;
    streetQuad?: string;
    streetName?: string;
    streetType?: string;
    otherAddr?: string;
    city?: string;
    zipCode?: string;
    county?: string;
    year?: string;
    searchType?: string;
    finalInvRqstdate?: Date;
    closedDate?: Date;
    sortColumn: number;
    sortOrder: number;
    pageNumber: number;
    rowsPerPage: number;
}
