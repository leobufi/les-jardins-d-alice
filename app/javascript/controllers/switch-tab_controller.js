import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tab", "content" ]

  // connect () {
  //   console.log('Hi Léo');
  // }

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
        console.log(event.currentTarget.dataset.tabName);
        content.classList.remove("d-none")
      } else {
        content.classList.add("d-none")
      }
    });
  }
}
