import { Routes } from '@angular/router';
import { Table1Component } from '../table-1/table-1.component';
import { Links1Component } from '../links-1/links-1.component';
import { ListsComponent } from '../lists/lists.component';
import { AlertButtonComponent } from '../alert-button/alert-button.component';
import { LeapYearComponent } from '../leap-year/leap-year.component';
import { ParentShoppingComponent } from '../parent-shopping/parent-shopping.component';

export const routes: Routes = [{path :'table-component', component : Table1Component},
    {path :'link-component', component : Links1Component},
    {path :'list-component', component : ListsComponent},
    {path :'Alert-Button-component', component : AlertButtonComponent},
    {path :'Leap-year-component', component : LeapYearComponent},
    {path :'shopping-list-component', component : ParentShoppingComponent},
];
