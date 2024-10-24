import { FormControl, FormGroup } from "@angular/forms";
import { Iaddress } from "./AddressInterface";

export interface IUserForm {
    firstname :FormControl<string|null>;
    lastname: FormControl<string|null>;
    email : FormControl<string|null>;
    phone : FormControl<number|null>;
    address: FormGroup<Iaddress>;
  
  
  }