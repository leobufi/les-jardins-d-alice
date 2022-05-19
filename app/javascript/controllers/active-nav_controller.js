import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "link" ]

  connect () {
    console.log(window.location.href);
    console.log(this.titleTarget.id);
    this.active();
  }

  active() {

      this.titleTargets.forEach((title) => {
        if (window.location.href.includes(title.id)) {
          console.log(title)
          title.classList.add("active")
        }
    });
  }
}
