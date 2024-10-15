import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParentShoppingComponent } from './parent-shopping.component';

describe('ParentShoppingComponent', () => {
  let component: ParentShoppingComponent;
  let fixture: ComponentFixture<ParentShoppingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ParentShoppingComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ParentShoppingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
