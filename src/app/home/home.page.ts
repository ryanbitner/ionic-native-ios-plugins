import { Component, OnInit } from '@angular/core';
import FullNamePlugin from '../fullname.plugin';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {


  constructor() {}

  ngOnInit(): void {
    this.getFullName();
  }

   async getFullName() {
   let fullname = await FullNamePlugin.getFullName({firstName: 'Ryan', lastName: 'Bitner'})
   console.log('!!!!FULL NAME!!!!')
   console.log(fullname);
  }

  async presentHelloWorld() {
    let enteredText = (await FullNamePlugin.presentHelloWorld({fullName: "Ryan Bitner"})).value;
    console.log('!!!!ENTERED TEXT!!!!')
    console.log(enteredText);
  }
}
