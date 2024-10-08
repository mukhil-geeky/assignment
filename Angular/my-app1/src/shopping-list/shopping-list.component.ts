import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-shopping-list',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './shopping-list.component.html',
  styleUrl: './shopping-list.component.scss'
})
export class ShoppingListComponent {

  items : string[] =[];
  newItem : string ='';

  addItem(){
    const trimmed = this.newItem.trim();
    if (trimmed)
    {
      this.items.push(trimmed);
      this.newItem = '';
    }
    else{
      alert('Please Enter a value')
    }
  }

  deleteItem(item : string)
  {
    const index = this.items.indexOf(item);
    if(index>-1)
    {
      this.items.splice(index,1);
    }
  }

}
