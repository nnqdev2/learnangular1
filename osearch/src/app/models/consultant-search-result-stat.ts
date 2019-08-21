export interface ConsultantSearchResultStat {
    reqCompanyName: string;
    reqAddress: string;
    reqCity: string;
    reqZipCode: string;
    reqPageNumber?: number;
    reqRowsPerPage?: number;
    reqSortColumn?: number;
    reqSortOrder?: number;
    totalRows?: number;
    totalPages?: number;
    consultantId: number;
    companyName: string;
    address: string;
    city: string;
    state: string;
    zipCode: string;
    phone: string;
    fax: string;
    email: string;
    lastChangeBy: string;
    lastChangeDate: number;
}
