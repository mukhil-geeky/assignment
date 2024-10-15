import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ItemsService {

  private AdditemService  = new Subject<string[]>();
  AdditemServiceobs = this.AdditemService.asObservable();

  setdata(item:string[])
  {
    this.AdditemService.next(item)
  }


}
