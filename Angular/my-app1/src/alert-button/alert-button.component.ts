import { AfterViewInit, Component } from '@angular/core';

@Component({
  selector: 'app-alert-button',
  standalone: true,
  imports: [],
  templateUrl: './alert-button.component.html',
  styleUrl: './alert-button.component.scss'
})
export class AlertButtonComponent implements AfterViewInit {
  ngAfterViewInit(): void {
    const button = document.getElementById("alertButton")
    if (button)
    {
      button.addEventListener("click",() =>
      {
        alert("Alert Button Clicked")
      })
    }
  }

}
