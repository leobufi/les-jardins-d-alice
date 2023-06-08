import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "tab",
    "subTab",
    "panel",
    "content",
    "partial",
    "title",
    "project"
  ]

  connect () {

  }

  activate(event) {
    event.preventDefault()
    const tab = event.target
    this.subTabTargets.forEach((tabTarget) => {
      // console.log(tab.dataset.tabName)
      tabTarget.classList.toggle("colored", tabTarget == tab)
    })

    this.panelTargets.forEach((panel) => {
      // console.log(panel.dataset.tabName)
      if (panel.dataset.tabName == tab.dataset.tabName) {
        panel.classList.toggle("activate")
      } else {
        panel.classList.remove("activate")
      }
    })
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

  show(event) {
    event.preventDefault()
    const title = event.target
    this.titleTargets.forEach((titleTarget) => {
      // console.log(title.dataset.tabName)
      titleTarget.classList.toggle("show", titleTarget == title)
    })

    this.projectTargets.forEach((project) => {
      // console.log(project.dataset.tabName)
      if (project.dataset.tabName == title.dataset.tabName) {
        project.classList.toggle("show")
      } else {
        project.classList.remove("show")
      }
    })
  }
}
