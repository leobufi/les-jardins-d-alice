import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "content", "partial"]

  connect () {

  }

  switch(event) {

    event.preventDefault();

    this.tabTargets.forEach((tab) => {

      // console.log(tab.dataset.tabName);
      if (tab.dataset.tabName == event.currentTarget.dataset.tabName) {
        tab.classList.add("active")
      } else {
        tab.classList.remove("active")
      }
    });

    this.contentTargets.forEach((content) => {
      if (content.dataset.tabName == event.currentTarget.dataset.tabName) {
        // console.log(content.id);
        content.classList.remove("d-none");
        this.partialTarget.classList.add("visually-hidden")
      } else {
        content.classList.add("d-none")
      }
    });
  }
}
