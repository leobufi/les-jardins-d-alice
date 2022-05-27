import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "tab", "content", "partial", "scroll" ]

  connect () {
    this.active();
    // console.log(this.partialTargets);
  }

  active() {

    this.titleTargets.forEach((title) => {
      if (window.location.href.includes(title.id)) {
        // console.log(title)
        title.classList.add("active");
      }
    });

    this.tabTargets.forEach((tab) => {
      // console.log(tab.id);
      if (window.location.href.includes(tab.id)) {
        tab.classList.add("active");
      } else {
        tab.classList.remove("active");
      }
    });

    this.contentTargets.forEach((content) => {
      if (window.location.href.includes(content.id)) {
        content.classList.remove("d-none");
        this.scrollTarget.scrollIntoView({block:"start", inline: "nearest", behavior: "smooth"}, true)
        this.partialTarget.classList.add("visually-hidden")
      } else {
        content.classList.add("d-none");
      }
    });

  }
}
