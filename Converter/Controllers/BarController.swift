import UIKit
import TinyLayout

class BarController: UIViewController {
    
    let controller: UIViewController
    let navigationBar = NavigationBar()
    
    init(controller: UIViewController) {
        self.controller = controller
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(controller)
        view.addSubviews([
            navigationBar,
            controller.view
        ], constraints: cons())
        navigationBar.item = controller.navigationItem
        view.backgroundColor = controller.view.backgroundColor
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            navigationBar.topAnchor.equal(view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leftAnchor.equal(view.leftAnchor),
            navigationBar.rightAnchor.equal(view.rightAnchor),
            navigationBar.heightAnchor.equal(scale(50)),
            
            controller.view.topAnchor.equal(navigationBar.bottomAnchor),
            controller.view.leftAnchor.equal(view.leftAnchor),
            controller.view.rightAnchor.equal(view.rightAnchor),
            controller.view.bottomAnchor.equal(view.bottomAnchor)
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
}

public extension UIViewController {
    
    func push(_ controller: UIViewController) {
        if let navigation = navigationController {
            navigation.pushViewController(
                BarController(controller: controller),
                animated: true
            )
        }
    }
    
    func addBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back")?.imageFlippedForRightToLeftLayoutDirection(),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }
    
    @objc func back() {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
