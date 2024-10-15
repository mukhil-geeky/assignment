import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'active',
  standalone: true
})
export class ActivePipe implements PipeTransform {

  transform(value: string, checkvalue : boolean): any {
    if(checkvalue===true)
    return value;
  }

}
