import { Plans } from "./plans.model";

export interface Calls {
    id?: string,
    origin: number,
    destiny: number,
    minutes: number,
    plan: Plans,
    withPlan: number | false,
    withoutPlan: number | false,
}

