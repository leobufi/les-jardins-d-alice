import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  disappear() {
    if (window.scrollY >= window.innerHeight/2) {
      this.element.classList.add("d-none")
    } else {
      this.element.classList.remove("d-none")
    }
  };

  appear() {
    if (window.scrollY >= window.innerHeight/6) {
      console.log('Hi')
      this.element.classList.remove("d-none")
    } else {
      this.element.classList.add("d-none")
    }
  };
}
