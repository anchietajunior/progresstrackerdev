import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "button"

  connect() {
    super.connect()
    this.notifyBridgeAndCreateButton()
  }

  notifyBridgeAndCreateButton() {
    const element = this.bridgeElement
    const image = element.bridgeAttribute("image")
    const side = element.bridgeAttribute("side") || "right"
    this.send("connect", { title: element.title, image, side }, () => {
      this.element.click()
    })
  }
}
