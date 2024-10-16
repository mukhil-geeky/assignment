import { CommonModule, UpperCasePipe } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, NgSelectOption, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivePipe } from '../pipe/active.pipe';
import { NgLabelTemplateDirective, NgOptionComponent, NgOptionTemplateDirective, NgSelectComponent, NgSelectModule } from '@ng-select/ng-select';

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
  projectname : FormControl<string|null>;
  address: FormGroup<address>;
}

interface Iprojects {
  name: string;
  isActive: boolean;
}



@Component({
  selector: 'app-forms',
  standalone: true,
  imports: [CommonModule,ReactiveFormsModule,UpperCasePipe,ActivePipe,NgSelectModule,NgSelectComponent,NgLabelTemplateDirective,
    NgOptionTemplateDirective
  ],
  templateUrl: './forms.component.html',
  styleUrl: './forms.component.scss'
})
export class FormsComponent {



 projects : Iprojects[] =   [
    { name: "Hilite", isActive: true },
    { name: "Lulu", isActive: true },
    { name: "Cordova School", isActive: true },
    { name: "Azure Heights Apartments", isActive: true },
    { name: "Greenfield Mall", isActive: true },
    { name: "Pinnacle Corporate Towers", isActive: true },
    { name: "Sunshine Valley Resort", isActive: true },
    { name: "Everest Office Park", isActive: false },
    { name: "Maplewood Villas", isActive: false },
    { name: "Sterling Shopping Complex", isActive: false }
  ];

  employee_form : FormGroup<UserForm>;

constructor(private em : FormBuilder){
  this.employee_form = this.em.group<UserForm>({
    firstname: new FormControl(null,Validators.required),
    lastname: new FormControl(null),
    email: new FormControl(null,[Validators.required,Validators.email]),
    phone : new FormControl(null,[Validators.required,Validators.pattern('^[0-9]{10}$')]),
    projectname : new FormControl(null),
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
