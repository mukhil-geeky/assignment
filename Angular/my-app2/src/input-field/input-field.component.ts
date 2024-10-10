import { CommonModule } from '@angular/common';
import { Component,EventEmitter,Input, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-input-field',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './input-field.component.html',
  styleUrl: './input-field.component.scss'
})
export class InputFieldComponent{
  @Input()  items : string[] =[];
  @Output() itemsChange = new EventEmitter<string[]>();

  newItem : string ='';

  addItem () {
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

}
