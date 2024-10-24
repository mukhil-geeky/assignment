import { Directive, ElementRef, Input, input, Output, TemplateRef, ViewContainerRef } from '@angular/core';

@Directive({
  selector: '[appCheckmail]',
  standalone: true
})
export class CheckmailDirective {

  

 @Input()set appCheckmail(email : string ) {
  if(email?.match('@gmail.com'))
  {
    this.view.createEmbeddedView(this.template)
  }
  else{
    this.view.clear()
  }

 }
  constructor(private template : TemplateRef<string>, private view : ViewContainerRef) { }
 


}
