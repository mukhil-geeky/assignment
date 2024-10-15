import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';


interface address{
  address1 : FormControl<string|null>;
  address2 : FormControl<string|null>;
  city : FormControl<string|null>;
}
interface UserForm {
  firstname :FormControl<string|null>;
  lastname: FormControl<string|null>;
  email : FormControl<string|null>;
  phone : FormControl<number|null>;
  address: FormGroup<address>;


}



@Component({
  selector: 'app-forms',
  standalone: true,
  imports: [ReactiveFormsModule,CommonModule], 
  templateUrl: './forms.component.html',
  styleUrl: './forms.component.scss'
})




export class FormsComponent {

employee_form : FormGroup<UserForm>;

constructor(private em : FormBuilder){
  this.employee_form = this.em.group<UserForm>({
    firstname: new FormControl(null,Validators.required),
    lastname: new FormControl(null),
    email: new FormControl(null,[Validators.required,Validators.email]),
    phone : new FormControl(null,[Validators.required,Validators.pattern('^[0-9]{10}$')]),
    address : this.em.group<address>({
      address1 : new FormControl(null),
      address2 : new FormControl(null),
      city : new FormControl(null)
    })

  })
}

formsubmited = false;


onSubmit() {

  this.formsubmited = true;
  // TODO: Use EventEmitter with form value
  console.warn(this.employee_form.value);
}


}
