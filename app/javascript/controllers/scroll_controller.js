import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title" ]

  connect () {
    // console.log('hi from scroll')
  }

  scroll() {
    this.titleTarget.scrollIntoView({block: "start", behavior: "smooth"})
  }
}
