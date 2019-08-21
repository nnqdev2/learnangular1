import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})

export class PrintService {
    print(printContents: string) {
        let popupWin: any;
        popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
        popupWin.document.write(`
        <html>
            <head>
                <style>
                    @page { size: auto;  margin: 0mm; }
                    @media print{ body{ margin: 20mm; } }
                </style>
            </head>
            <body onload="window.print()">${printContents}</body>
        </html>`
        );
        popupWin.document.close();
    }
}
