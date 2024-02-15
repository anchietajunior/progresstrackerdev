import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "button"
  static targets = ["add"]

  connect() {
    super.connect()


    this.send("connect", {}, () => {
      this.addTarget.click()
    })
  }

}
