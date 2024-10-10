import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';
import { InputFieldComponent } from '../input-field/input-field.component';
import { OutputFieldComponent } from '../output-field/output-field.component';


@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,FormsModule,CommonModule,InputFieldComponent,OutputFieldComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'my-app2';

  items : string[] =[];
  // newItem : string ='';

  // addItem () {
  //   const trimmed = this.newItem.trim();
  //   if (trimmed)
  //   {
  //     this.items.push(trimmed);
  //     this.newItem = '';

  //   }
  //   else{
  //     alert('Please Enter a value')
  //   }
  // }

  // deleteItem(item : string)
  // {
  //   const index = this.items.indexOf(item);
  //   if(index>-1)
  //   {
  //     this.items.splice(index,1);
  //   }
  // }
}
