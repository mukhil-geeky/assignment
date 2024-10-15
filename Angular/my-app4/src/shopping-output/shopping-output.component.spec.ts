import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShoppingOutputComponent } from './shopping-output.component';

describe('ShoppingOutputComponent', () => {
  let component: ShoppingOutputComponent;
  let fixture: ComponentFixture<ShoppingOutputComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ShoppingOutputComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShoppingOutputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
