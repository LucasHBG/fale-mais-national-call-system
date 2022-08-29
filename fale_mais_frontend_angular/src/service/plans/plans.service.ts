import { Injectable } from '@angular/core';

import { PLANS } from 'src/shared/mock-plans';

@Injectable()
export class PlansService {
  
  // Get all Plans from db
  getPlans() {
    return Promise.resolve(PLANS);
  }
}
