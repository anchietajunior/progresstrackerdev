import Strada
import UIKit
import Foundation

class ButtonComponent: BridgeComponent {
    override class var name: String { "button" }
    
    override func onReceive(message: Message) {
        print(message.event)
        
        let add = UIAction(title: "Add") { _ in
            print("Click ->")
            self.reply(to: "connect")
        }
        
        let image = UIImage(systemName: "plus")
        viewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, primaryAction: add)
    }
    
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }
}
