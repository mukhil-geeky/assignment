import { Component } from '@angular/core';

@Component({
  selector: 'app-leap-year',
  standalone: true,
  imports: [],
  templateUrl: './leap-year.component.html',
  styleUrl: './leap-year.component.scss'
})
export class LeapYearComponent {

  isLeap : string = '';

  isLeapYear(year : number) : boolean {
    if (year % 4 === 0) {
        if (year % 100 === 0) {
            return year % 400 === 0;
        }
        return true;
    }
    return false;

}
 checkLeapYear(yeari : string) {
   const year = parseInt(yeari,10);
      const result = this.isLeapYear(year);
      this.isLeap = result ? `${year} is a leap year.` : `${year} is not a leap year.`; 
  }

}
