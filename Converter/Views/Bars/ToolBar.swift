import UIKit
import TinyLayout

class ToolBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([
            refreshButton,
            indicator,
            titleLabel,
            dateLabel,
            settingsButton
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        let p = scale(10)
        return [
            refreshButton.leftAnchor.equal(leftAnchor),
            refreshButton.topAnchor.equal(topAnchor),
            refreshButton.bottomAnchor.equal(bottomAnchor),
            refreshButton.widthAnchor.equal(heightAnchor),
            
            indicator.leftAnchor.equal(leftAnchor),
            indicator.topAnchor.equal(topAnchor),
            indicator.bottomAnchor.equal(bottomAnchor),
            indicator.widthAnchor.equal(heightAnchor),
            
            titleLabel.topAnchor.equal(topAnchor, scale(6)),
            titleLabel.leftAnchor.equal(refreshButton.rightAnchor, p),
            titleLabel.rightAnchor.equal(settingsButton.leftAnchor, -p),
            
            dateLabel.leftAnchor.equal(refreshButton.rightAnchor, p),
            dateLabel.rightAnchor.equal(settingsButton.leftAnchor, -p),
            dateLabel.topAnchor.equal(titleLabel.bottomAnchor, scale(3)),
            
            settingsButton.topAnchor.equal(topAnchor),
            settingsButton.rightAnchor.equal(rightAnchor),
            settingsButton.bottomAnchor.equal(bottomAnchor),
            settingsButton.widthAnchor.equal(heightAnchor)
        ]
    }
    
    let refreshButton = BarButton {
        $0.accessibilityIdentifier = "refresh"
        $0.iconView.setIcon("refresh", color: .tint)
    }
    
    let settingsButton = BarButton {
        $0.accessibilityIdentifier = "settings"
        $0.iconView.setIcon("settings", color: .tint)
    }
    
    let titleLabel = UILabel {
        $0.numberOfLines = 1
        $0.textColor = .text
        $0.textAlignment = .center
        $0.font = .system(scale(16))
        $0.adjustsFontSizeToFitWidth = true
    }
    
    let dateLabel = UILabel {
        $0.numberOfLines = 1
        $0.textColor = .subtext
        $0.textAlignment = .center
        $0.font = .system(scale(12))
    }
    
    var indicator = UIActivityIndicatorView {
        $0.style = .medium
        let factor = Scale.factor
        $0.transform = CGAffineTransform(
            scaleX: factor,
            y: factor
        )
        $0.hidesWhenStopped = true
    }
    
    func showIndicator() {
        delay(0.1) {
            self.indicator.startAnimating()
            self.refreshButton.isHidden = true
        }
    }
    
    func hideIndicator() {
        delay(0.6) {
            self.indicator.stopAnimating()
            self.refreshButton.isHidden = false
        }
    }
    
    var isActual = true {
        didSet {
            dateLabel.textColor = isActual ?
                .dateActual :
                .dateNotActual
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
