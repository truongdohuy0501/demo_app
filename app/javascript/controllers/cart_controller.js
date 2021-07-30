import { ApplicationController } from 'stimulus-use'

export default class extends ApplicationController {
  static targets = ['counterView']

  refreshTotal(e) {
    console.log('1')
    this.counter += e.detail.quantity
    console.log(e.detail.controller) // the emitting item_controller
  }

  renderCounter() {
    console.log('2')
    this.counterViewTarget.textContent = this.counter
  }

  set counter(value) {
    console.log('3')
    this.data.set('counter', value)
    this.renderCounter()
  }

  get counter() {
    console.log('4')
    return parseInt(this.data.get('counter'))
  }
}