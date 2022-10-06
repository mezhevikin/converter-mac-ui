import UIKit
import TinyLayout

class NavigationController: UINavigationController, UINavigationControllerDelegate {

    let navBar = NavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        delegate = self
        setValue(navBar, forKey: "navigationBar")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        willShow controller: UIViewController,
        animated: Bool
    ) {
        navBar.item = controller.navigationItem
    }

    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        
    }

}
