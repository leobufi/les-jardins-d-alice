import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disapear"
export default class extends Controller {
  connect() {
    console.log('test alert')
  }
}
