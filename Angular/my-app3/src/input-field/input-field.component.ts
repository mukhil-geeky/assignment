import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ItemsService } from '../items.service';

@Component({
  selector: 'app-input-field',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './input-field.component.html',
  styleUrl: './input-field.component.scss'
})
export class InputFieldComponent {

  items : string[] = [];


 constructor(private addItemService : ItemsService){



 }

  newItem : string ='';

  addItem () {
    const trimmed = this.newItem.trim();
    if (trimmed)
    {
      this.items.push(trimmed);
      this.newItem = '';
      this.addItemService.setdata(this.items)

    }
    else{
      alert('Please Enter a value')
    }
  }
}
