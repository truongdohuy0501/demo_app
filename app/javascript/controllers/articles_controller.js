import { ApplicationController} from 'stimulus-use'

export default class extends ApplicationController {

  static targets = ['counterView']

  refreshTotal(e) {
    console.log(e.detail.david)
    this.counter += e.detail.david
  }

  renderCounter() {
    this.counterViewTarget.textContent = this.counter
  }

  set counter(value) {
    this.data.set('counter', value)
    this.renderCounter()
  }

  get counter() {
    console.log(this.data)
    console.log(parseInt(this.data.get('counter')))
    return parseInt(this.data.get('counter'))
  }

  connect() {
    console.log('Hello to New Articles!');
    this.isPreview // true/false if it is a Turbolinks preview
    this.isConnected // true/false if the controller is connected
    this.dispatch("hello") // helper to dispatch a custom event "greet:hello" to other Stimulus controllers
  }

  countCharacters() {
    let characters = this.titleTarget.value.length;
    this.counterTarget.innerText = characters;
  }


}
