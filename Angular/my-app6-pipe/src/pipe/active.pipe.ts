import { Pipe, PipeTransform } from '@angular/core';
import { filter } from 'rxjs';

@Pipe({
  name: 'active',
  standalone: true
})
export class ActivePipe implements PipeTransform {

  transform(value: any, isActive: boolean): any {
    return value.filter((p:any) => p.isActive=== isActive);
  }

}
