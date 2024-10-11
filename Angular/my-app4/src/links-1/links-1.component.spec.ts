import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Links1Component } from './links-1.component';

describe('Links1Component', () => {
  let component: Links1Component;
  let fixture: ComponentFixture<Links1Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Links1Component]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Links1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
