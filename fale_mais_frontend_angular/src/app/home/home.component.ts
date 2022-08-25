import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  callSimulatorForm: FormGroup = new FormGroup({
    origin: new FormControl(''),
    destiny: new FormControl(''),
    minutes: new FormControl(''),
  });

  constructor() {}

  ngOnInit(): void {}
}
