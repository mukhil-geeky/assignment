import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-output-field',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './output-field.component.html',
  styleUrl: './output-field.component.scss'
})
export class OutputFieldComponent {

  @Input()  items : string[] =[];
  @Output() itemsChange = new EventEmitter<string[]>();

  deleteItem(item : string)
  {
    const index = this.items.indexOf(item);
    if(index>-1)
    {
      this.items.splice(index,1);
    }
  }

}
