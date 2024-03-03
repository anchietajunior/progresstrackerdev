import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.hideFlashAfterTimeout()
  }

  hideFlashAfterTimeout() {
    setTimeout(() => {
      this.element.remove()
    }, 5000)
  }
}
