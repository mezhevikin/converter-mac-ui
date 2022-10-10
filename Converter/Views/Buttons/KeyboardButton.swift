import UIKit
import TinyLayout

class KeyboardButton: UIControl {
    
    let item: KeyboardItem
    
    init(item: KeyboardItem) {
        self.item = item
        super.init(frame: .zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isAccessibilityElement = true
        accessibilityTraits = .button
        backgroundColor = .hex("#ffffff", 0.2)
        titleLabel.text = item.symbol
        addSubview(titleLabel, constraints: [
            titleLabel.leftAnchor.equal(leftAnchor),
            titleLabel.topAnchor.equal(topAnchor),
            titleLabel.rightAnchor.equal(rightAnchor),
            titleLabel.bottomAnchor.equal(bottomAnchor)
        ])
    }
    
    lazy var titleLabel = UILabel {
        $0.textColor = .text
        $0.font = .system(scale(14))
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
}

