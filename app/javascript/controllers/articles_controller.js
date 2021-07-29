import { Controller } from "stimulus"

export default class extends Controller {
  static get targets() {
    return ['title', 'counter'];
  }

  connect() {
    console.log('Hello to New Articles!');
  }

  countCharacters() {
    let characters = this.titleTarget.value.length;
    this.counterTarget.innerText = characters;
  }


}
