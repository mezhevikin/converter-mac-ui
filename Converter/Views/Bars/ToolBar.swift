import UIKit
import SnapKit

class ToolBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([
            refreshButton,
            indicator,
            titleLabel,
            dateLabel,
            settingsButton
        ])
        makeConstains()
    }
    
    func makeConstains() {
        refreshButton.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self)
            $0.width.equalTo(self.snp.height)
        }
        indicator.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self)
            $0.width.equalTo(self.snp.height)
        }
        settingsButton.snp.makeConstraints {
            $0.right.top.bottom.equalTo(self)
            $0.width.equalTo(self.snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(refreshButton.snp.right).offset(scale(10))
            $0.right.equalTo(settingsButton.snp.left).offset(-scale(10))
            $0.top.equalTo(self).offset(scale(6))
        }
        dateLabel.snp.makeConstraints {
            $0.left.right.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(scale(3))
        }
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
