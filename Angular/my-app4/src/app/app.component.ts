import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { Table1Component } from '../table-1/table-1.component';
import { Links1Component } from '../links-1/links-1.component';
import { ListsComponent } from '../lists/lists.component';
import { AlertButtonComponent } from '../alert-button/alert-button.component';
import { LeapYearComponent } from '../leap-year/leap-year.component';
import { ParentShoppingComponent } from '../parent-shopping/parent-shopping.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,CommonModule,RouterOutlet,
    RouterLinkActive,RouterLink,Table1Component,Links1Component,
    ListsComponent,AlertButtonComponent,LeapYearComponent,ParentShoppingComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'my-app4';
}
