import UIKit
import TinyLayout

class ConverterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = l("Currency converter")
        view.addBody(converteView, safe: true)
    }
    
    lazy var converteView = ConverterView {
        $0.backgroundColor = .red
    }
    
}

