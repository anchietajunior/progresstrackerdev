import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "menu"

  connect() {
    super.connect()

    this.send("connect", {}, () => {
    })
  }

}
