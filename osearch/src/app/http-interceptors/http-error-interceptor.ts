import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AppConfig } from '../app.config';

@Injectable()
export class HttpErrorInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(req)
      .pipe(catchError(err => {
        if (err instanceof HttpErrorResponse
            && (req.method === 'GET')
            && this.selectedUrl(req.url)
            && (err.status === 404)) {
          return of(null);
        }
        throw(err);
      }));
  }

  private selectedUrl(url: string): boolean {
    return  (-1 < url.indexOf(AppConfig.olprrapi_lust)
          && ((-1 < url.indexOf('/pcspcspermit/'))
              ||  (-1 < url.indexOf('/assessment'))
          )
    );
  }
}

