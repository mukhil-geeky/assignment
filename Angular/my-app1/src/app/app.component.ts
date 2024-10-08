import { AfterViewInit, Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Table1Component } from '../table-1/table-1.component';
import { Links1Component } from '../links-1/links-1.component';
import { ListItemsComponent } from '../list-items/list-items.component';
import { AlertButtonComponent } from '../alert-button/alert-button.component';
import { LeapYearComponent } from '../leap-year/leap-year.component';
import { FormsModule } from '@angular/forms';
import { ShoppingListComponent } from '../shopping-list/shopping-list.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,Table1Component,Links1Component,ListItemsComponent,AlertButtonComponent,LeapYearComponent,FormsModule,ShoppingListComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'

})
export class AppComponent {

  title = 'my-app1';

}
