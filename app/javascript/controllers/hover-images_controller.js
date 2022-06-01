import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "img", "infos", "cart", "cartInfos" ]

  // connect () {
  //   console.log('Hi Hi Hi');
  // }

  showInfos() {

    this.imgTargets.forEach((img) => {
      this.infosTarget.classList.remove("d-none")
      img.classList.add("d-none")
    });
  }

  showImage() {

    this.infosTargets.forEach((info) => {
      info.classList.add("d-none")
      this.imgTarget.classList.remove("d-none")
    });
  }

  showCart() {

    this.cartInfosTargets.forEach((info) => {
      this.cartTarget.classList.remove("d-none")
      info.classList.add("d-none")
    });
  }

  showCartInfos() {

    this.cartTargets.forEach((cart) => {
      cart.classList.add("d-none")
      this.cartInfosTarget.classList.remove("d-none")
    });
  }
}
