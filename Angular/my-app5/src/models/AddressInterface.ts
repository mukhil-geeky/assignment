import { FormControl } from "@angular/forms";


export interface Iaddress{
    address1 : FormControl<string|null>;
    address2 : FormControl<string|null>;
    city : FormControl<string|null>;
  }