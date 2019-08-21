export interface ConsultantSearchFilter {
    companyName?: string;
    address?: string;
    city?: string;
    zipCode?: string;
    pageNumber: number;
    rowsPerPage: number;
    sortColumn: number;
    sortOrder: number;
}
