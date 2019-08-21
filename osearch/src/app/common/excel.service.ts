import { Injectable } from '@angular/core';
import * as xlsx from 'xlsx';

@Injectable({
  providedIn: 'root'
})
export class ExcelService {

  constructor() { }

  public exportJson(json: any[], fileName: string): void {
    const fileNameWTime = fileName + '_' + new Date().getTime();
    const ws: xlsx.WorkSheet = xlsx.utils.json_to_sheet(json);
    const wb: xlsx.WorkBook = xlsx.utils.book_new();
    xlsx.utils.book_append_sheet(wb, ws, fileNameWTime);
    // xlsx.writeFile(wb, fileNameWTime + '.xlsx');
    xlsx.writeFile(wb, fileNameWTime + '.csv');
  }

}
