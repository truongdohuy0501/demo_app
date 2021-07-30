import { ApplicationController } from 'stimulus-use'

export default class extends ApplicationController {
  add() {
    this.dispatch('add', { david: 1 })
  }
}