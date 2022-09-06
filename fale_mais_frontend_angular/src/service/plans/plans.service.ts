import { Injectable } from '@angular/core';

import { PLANS } from 'src/shared/mock-plans';

@Injectable()
export class PlansService {
  
  /**
   * Get all `Plans` objects from db(not implemented) or mocked-plans list
   * 
   * @returns Promise with current values from mocked-calls list
   */
  getPlans() {
    return Promise.resolve(PLANS);
  }
}
