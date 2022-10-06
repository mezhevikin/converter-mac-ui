import UIKit
import TinyLayout

class BarButton: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView, constraints: [
            iconView.widthAnchor.equal(scale(24)),
            iconView.heightAnchor.equal(scale(24)),
            iconView.centerXAnchor.equal(centerXAnchor),
            iconView.centerYAnchor.equal(centerYAnchor)
        ])
    }
    
    let iconView = UIImageView()
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.3 : 1
        }
    }
    
    func setItem(_ item: UIBarButtonItem) {
        if let image = item.image {
            iconView.setImage(image, color: .tint)
        }
        if let target = item.target, let action = item.action {
            addTarget(target, action)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
