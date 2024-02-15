import Strada
import UIKit
import Foundation

class MenuComponent: BridgeComponent {
    override class var name: String { "menu" }
    
    override func onReceive(message: Message) {
        let add = UIAction(title: "Add") { _ in
            // Do something when tapped.
            print("Add")
        }
        let edit = UIAction(title: "Edit") { _ in
            // Do something when tapped.
            print("Edit")
        }

        let image = UIImage(systemName: "ellipsis.circle")
        let menu = UIMenu(children: [add, edit])
        viewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, menu: menu)
    }
    
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }
}
