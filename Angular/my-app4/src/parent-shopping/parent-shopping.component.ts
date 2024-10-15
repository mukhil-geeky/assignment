import { Component } from '@angular/core';
import { ShoppingInputComponent } from '../shopping-input/shopping-input.component';
import { ShoppingOutputComponent } from '../shopping-output/shopping-output.component';

@Component({
  selector: 'app-parent-shopping',
  standalone: true,
  imports: [ShoppingInputComponent,ShoppingOutputComponent],
  templateUrl: './parent-shopping.component.html',
  styleUrl: './parent-shopping.component.scss'
})
export class ParentShoppingComponent {

}
