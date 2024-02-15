import Strada
import Foundation

class LogComponent: BridgeComponent {
    override class var name: String { "log" }
    
    override func onReceive(message: Message) {
        print("LogComponent")
        print(message.event)
    }
}
