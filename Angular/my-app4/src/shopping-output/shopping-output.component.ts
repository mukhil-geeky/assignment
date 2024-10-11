import { Component } from '@angular/core';
import { ItemsService } from '../items.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-shopping-output',
  standalone: true,
  imports: [FormsModule,CommonModule],
  templateUrl: './shopping-output.component.html',
  styleUrl: './shopping-output.component.scss'
})
export class ShoppingOutputComponent {

  items : string[] =[];

  constructor( private viewItemService : ItemsService ){}
  
  ngOnInit()
  {
    this.viewItemService.AdditemServiceobs.subscribe(x => this.items=x)
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
