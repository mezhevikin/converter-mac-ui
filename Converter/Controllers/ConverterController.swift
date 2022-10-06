import UIKit
import TinyLayout

class ConverterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = l("Currency converter")
        view.addBody(converteView, safe: true)
        addNavigationBarButtons()
    }
    
    lazy var converteView = ConverterView {
        $0.backgroundColor = .red
    }
    
    func addNavigationBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "refresh"),
            style: .plain,
            target: self,
            action: #selector(refresh)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "settings"),
            style: .plain,
            target: self,
            action: #selector(openSettings)
        )
    }
    
    @objc func refresh() {
        
    }
    
    @objc func openSettings() {
        
    }
    
}

