import { Component, OnInit } from '@angular/core';
import { CallsService } from 'src/service/calls/calls.service';
import { Calls } from 'src/shared/model/calls.model';

@Component({
  selector: 'app-calls',
  templateUrl: './calls.component.html',
  styleUrls: ['./calls.component.css'],
  providers: [CallsService],
})
export class CallsComponent implements OnInit {
  calls: Calls[] = [];

  constructor(private callsService: CallsService) {}

  ngOnInit(): void {
    this.callsService.getCalls().then((calls) => (this.calls = calls));
  }
}
