import UIKit
import TinyLayout

class NavigationBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([
            leftButton,
            titleLabel,
            rightButton
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            leftButton.leadingAnchor.equal(leadingAnchor),
            leftButton.topAnchor.equal(topAnchor),
            leftButton.bottomAnchor.equal(bottomAnchor),
            leftButton.widthAnchor.equal(scale(50)),
            
            titleLabel.leadingAnchor.equal(leftButton.trailingAnchor),
            titleLabel.topAnchor.equal(topAnchor),
            titleLabel.bottomAnchor.equal(bottomAnchor),
            
            rightButton.leadingAnchor.equal(titleLabel.trailingAnchor),
            rightButton.topAnchor.equal(topAnchor),
            rightButton.bottomAnchor.equal(bottomAnchor),
            rightButton.trailingAnchor.equal(trailingAnchor),
            rightButton.widthAnchor.equal(scale(50))
        ]
    }
    
    private let leftButton = BarButton {
        $0.tintColor = .tint
        $0.accessibilityIdentifier = "leftNavigationButton"
    }
    
    private let rightButton = BarButton {
        $0.tintColor = .tint
        $0.accessibilityIdentifier = "rightNavigationButton"
    }
    
    private let titleLabel = UILabel {
        $0.textColor = .text
        $0.textAlignment = .center
        $0.font = .bold(scale(17))
        $0.adjustsFontSizeToFitWidth = true
    }
    
    var item: UINavigationItem? {
        didSet {
            if let leftItem = item?.leftBarButtonItem {
                leftButton.setItem(leftItem)
            }
            if let rightItem = item?.rightBarButtonItem {
                rightButton.setItem(rightItem)
            }
            titleLabel.text = item?.title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
}
