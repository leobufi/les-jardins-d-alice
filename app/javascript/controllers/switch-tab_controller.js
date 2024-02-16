import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "tab",
    "subTab",
    "panel",
    "content",
    "partial",
    "title",
    "project",
    "arrow"
  ]

  connect () {
     console.log(this.arrowTargets)
     this.switch(0);
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
    const index = this.tabTargets.indexOf(event.target);

    this.tabTargets.forEach((tab, i) => {
      if (tab.dataset.tabName == event.currentTarget.dataset.tabName) {
        tab.classList.toggle("active", i === index);
      }
      else {
        tab.classList.remove("active")
      }
    });

    this.contentTargets.forEach((content, i) => {
      if (content.dataset.tabName == event.currentTarget.dataset.tabName) {
        content.classList.toggle("activate", i === index);
        // content.classList.remove("d-none");
        this.partialTarget.classList.add("visually-hidden")
      }
      else {
        content.classList.remove("activate")
      }
    });
  }

  show(event) {
    event.preventDefault()
    const title = event.target

    console.log(this.arrowTargets)

    this.arrowTargets.forEach((arrow) => {
      if (arrow.dataset.tabName == title.dataset.tabName) {
        arrow.classList.toggle("rotate")
      } else {
        arrow.classList.remove("rotate")
      }
    })

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
