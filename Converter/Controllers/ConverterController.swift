import UIKit
import TinyLayout

class ConverterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBody(converteView, safe: true)
    }
    
    lazy var converteView = ConverterView {
        $0.toolBar.titleLabel.text = l("Currency converter")
        $0.toolBar.dateLabel.text = "10.10.2022 14:02"
        $0.toolBar.isActual = true
        $0.toolBar.refreshButton.addTarget(self, #selector(refresh))
        $0.toolBar.settingsButton.addTarget(self, #selector(openSettings))
    }
    
    @objc func refresh() {
        converteView.toolBar.showIndicator()
        delay(0.5) {
            self.converteView.toolBar.hideIndicator()
        }
    }
    
    @objc func openSettings() {
        push(SettingsController())
    }
    
}

