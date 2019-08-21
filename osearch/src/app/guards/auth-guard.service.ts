import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router/src/utils/preactivation';
import { AuthService } from '../services/auth.service';
import { Router, ActivatedRoute, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Constants } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService  implements CanActivate {
  path: any;
  route: any;

  constructor(private authService: AuthService, private router: Router) { }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    if (this.authService.isLoggedIn() ) {
      return true;
    }
    const clientRoot = this.authService.getClientRoot();
    localStorage.setItem(`${clientRoot}:${Constants.authPage}`, state.url);
    this.authService.startAuthentication();
    return false;
  }
}


