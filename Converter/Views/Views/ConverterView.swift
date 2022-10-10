import UIKit
import TinyLayout

class ConverterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([
            toolBar,
            fieldsView,
            keyboardView
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            toolBar.leftAnchor.equal(leftAnchor),
            toolBar.topAnchor.equal(topAnchor),
            toolBar.rightAnchor.equal(rightAnchor),
            toolBar.heightAnchor.equal(scale(50)),
            
            fieldsView.leftAnchor.equal(leftAnchor),
            fieldsView.topAnchor.equal(toolBar.bottomAnchor),
            fieldsView.rightAnchor.equal(rightAnchor),
            fieldsView.heightAnchor.equal(scale(350)),
            
            keyboardView.leftAnchor.equal(leftAnchor),
            keyboardView.topAnchor.equal(fieldsView.bottomAnchor),
            keyboardView.rightAnchor.equal(rightAnchor),
            keyboardView.bottomAnchor.equal(bottomAnchor)
        ]
    }
    
    let toolBar = ToolBar()
    
    let fieldsView = UIStackView {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        for currency in Currency.all.prefix(7) {
            let field = CurrencyField()
            field.currency = currency
            $0.addArrangedSubview(field)
        }
    }
    
    let keyboardView = KeyboardView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
