import UIKit
import TinyLayout

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = l("Settings")
        view.backgroundColor = .gray
        addBackButton()
    }
    
}

