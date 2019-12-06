import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http'
import { List } from '../interfaces/list';
import { tap } from 'rxjs/operators';
import { environment } from '../../environments/environment'

@Injectable({
  providedIn: 'root'
})
export class ListService {
  private readonly API = `${environment.API}`

  constructor(
    private http : HttpClient ,
  ) { }

  

}
