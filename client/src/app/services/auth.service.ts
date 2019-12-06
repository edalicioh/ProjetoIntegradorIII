import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { tap } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private  url = environment.API
  constructor(
    private http: HttpClient
  ) { }

  login( user )  {
    return this.http.post<any>( `${this.url}/login`, user) 
      .pipe( tap( data => {
        localStorage.setItem("token" , data.token)
        localStorage.setItem("user" , btoa(JSON.stringify(data.user)))
      } ) )
  }

  searchEmail(email){
    return this.http.post<any>( `${this.url}/sign`, email)
  }

  upPassword(data){
    return this.http.post<any>( `${this.url}/upPassword`, data)
  }


}
