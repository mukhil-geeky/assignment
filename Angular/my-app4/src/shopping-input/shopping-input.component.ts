import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ItemsService } from '../items.service';

@Component({
  selector: 'app-shopping-input',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './shopping-input.component.html',
  styleUrl: './shopping-input.component.scss'
})
export class ShoppingInputComponent {

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
