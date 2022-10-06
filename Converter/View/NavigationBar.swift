import UIKit
import TinyLayout

class NavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBody(contentView)
        contentView.addSubviews([
            leftButton,
            titleLabel,
            rightButton
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            leftButton.leadingAnchor.equal(contentView.leadingAnchor),
            leftButton.topAnchor.equal(contentView.topAnchor),
            leftButton.bottomAnchor.equal(contentView.bottomAnchor),
            leftButton.widthAnchor.equal(50),
            
            titleLabel.leadingAnchor.equal(leftButton.trailingAnchor),
            titleLabel.topAnchor.equal(contentView.topAnchor),
            titleLabel.bottomAnchor.equal(contentView.bottomAnchor),
            
            rightButton.leadingAnchor.equal(titleLabel.trailingAnchor),
            rightButton.topAnchor.equal(contentView.topAnchor),
            rightButton.bottomAnchor.equal(contentView.bottomAnchor),
            rightButton.trailingAnchor.equal(contentView.trailingAnchor),
            rightButton.widthAnchor.equal(50)
        ]
    }
    
    private let contentView = UIView {
        $0.backgroundColor = .cyan
    }
    
    private let leftButton = BarButton {
        $0.tintColor = .blue
        $0.accessibilityIdentifier = "leftNavigationButton"
    }
    
    private let rightButton = BarButton {
        $0.tintColor = .blue
        $0.accessibilityIdentifier = "rightNavigationButton"
    }
    
    private let titleLabel = UILabel {
        $0.textColor = .label
        $0.textAlignment = .center
        $0.font = .bold(17)
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
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 75)
    }
    
}
