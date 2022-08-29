import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CallsService } from 'src/service/calls/calls.service';
import { PlansService } from 'src/service/plans/plans.service';
import { Plans } from 'src/shared/model/plans.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  providers: [PlansService, CallsService],
})
export class HomeComponent implements OnInit {
  public isSubmitted: boolean = false;
  public plans: Plans[] = [];

  constructor(
    private formBuilder: FormBuilder,
    private plansService: PlansService,
    private callsService: CallsService
  ) {}

  public callSimulatorForm: FormGroup = this.formBuilder.group({
    origin: ['', [Validators.required, Validators.maxLength(3)]],
    destiny: ['', [Validators.required, Validators.maxLength(3)]],
    minutes: ['', [Validators.required, Validators.maxLength(5)]],
    plan: ['FaleMais 30'],
  });

  get origin() {
    return this.callSimulatorForm.get('origin');
  }

  get destiny() {
    return this.callSimulatorForm.get('destiny');
  }

  get minutes() {
    return this.callSimulatorForm.get('minutes');
  }

  get plan() {
    return this.callSimulatorForm.get('plan');
  }

  ngOnInit(): void {
    this.plansService.getPlans().then((plans) => (this.plans = plans));
  }

  onSubmit() {
    this.isSubmitted = true;
    console.log(this.callSimulatorForm.value);
    this.callsService.saveCalls(this.callSimulatorForm.value);
  }
}
