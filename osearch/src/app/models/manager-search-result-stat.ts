export interface ManagerSearchResultStat {
    reqUserName: string;
    reqAssignedDate: Date;
    reqEndDt: Date;
    reqLastChangeBy?: string;
    reqLastChangeDate?: Date;
    reqSortColumn?: number;
    reqSortOrder?: number;
    totalRows?: number;
    totalPages?: number;
    userName: string;
    assignedDate: Date;
    endDt: Date;
    lastChangeBy: string;
    lastChangeDate: Date;
}
