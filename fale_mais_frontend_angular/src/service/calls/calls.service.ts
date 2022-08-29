import { Injectable } from '@angular/core';
import { Calls } from 'src/shared/model/calls.model';

@Injectable({
  providedIn: 'root'
})
export class CallsService {
  mockedCalls: Calls[] = [];

  // Get all Calls history from db
  getCalls(){
    return Promise.resolve(this.mockedCalls);
  }

  // Push Call objecto to the List
  saveCalls(calls: Calls){
    this.mockedCalls.push(calls);
  }
}
