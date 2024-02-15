import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "log"

  connect() {
    super.connect()

    this.send("connect", {}, () => {

    })
  }
}
