import UIKit
import TinyLayout

class ConverterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //toolBar.backgroundColor = .blue
        addSubviews([
            toolBar
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            toolBar.leftAnchor.equal(leftAnchor),
            toolBar.topAnchor.equal(topAnchor),
            toolBar.rightAnchor.equal(rightAnchor),
            toolBar.heightAnchor.equal(scale(50))
        ]
    }
    
    let toolBar = ToolBar()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
