import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AddressCorrectStat } from '../models/address-correct-stat';
import { AppConfig } from '../app.config';

@Injectable({
  providedIn: 'root'
})
export class AddressCorrectDataService {
  constructor(private http: HttpClient)  { }
  getAddressCorrectStat(address: string, city: string, state: string): Observable<AddressCorrectStat> {
    const params = new HttpParams({
        fromString: `t=ODEQAVS&id=119262399&act=Check&cols=CountyFIPS,GrpParsedAddress`
        + `&opt=UsePreferredCity:off;Diacritics:off;AdvancedAddressCorrection:off;LongAddressFormat:off;`
        + `&a1=${address}&city=${city}`
        + `&state=${state}&ctry=USA`
        + `&reserved=`
    });
    return this.http.get<AddressCorrectStat>(AppConfig.address_correction, { params: params });
  }
}
