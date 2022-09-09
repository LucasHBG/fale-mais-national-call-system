import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from "@angular/forms";

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { CallsComponent } from './home/calls/calls.component';
import { CallsService } from 'src/service/calls/calls.service';
import { PlansService } from 'src/service/plans/plans.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    CallsComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
  ],
  providers: [ CallsService, PlansService, ],
  bootstrap: [AppComponent]
})
export class AppModule { }
