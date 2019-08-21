import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AppConfig } from '../app.config';

@Injectable()
export class AddHeaderInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if (byPass(req.url)) {
      return next.handle(req);
    }
    const jsonReq: HttpRequest<any> = req.clone({
      setHeaders: {'Accept': 'application/json', 'Content-Type': 'application/json', 'Cache-Control': 'no-cache', 'Pragma': 'no-cache'}
    });
    return next.handle(jsonReq);
  }
}
function byPass(url: string): boolean {
  return  (-1 < url.indexOf(AppConfig.address_correction)
  );
}
