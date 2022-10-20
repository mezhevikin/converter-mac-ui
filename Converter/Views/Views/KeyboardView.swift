import UIKit
import TinyLayout

class KeyboardView: UIView {
    
    let buttons: [KeyboardButton] = [
        .clear, .seven, .eight, .nine,
        .backspace, .four, .five, .six,
        .calculator, .one, .two, .tree,
        .zero, .dot
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var constains = [NSLayoutConstraint]()
        for button in buttons {
            if button != .clear {
                constains.append(button.widthAnchor.equal(KeyboardButton.clear.widthAnchor))
            }
            if button != .zero {
                constains.append(button.widthAnchor.equal(KeyboardButton.clear.widthAnchor))
            }
            if button != .calculator {
                constains.append(button.heightAnchor.equal(KeyboardButton.clear.heightAnchor))
            }
        }
        addSubviews(buttons, constraints: constains)
    }
    
    required init(coder: NSCoder) {
        fatalError("init")
    }
    
}

class KeyboardButton: UIControl {
    
    let symbol: String
    
    init(_ symbol: String) {
        self.symbol = symbol
        super.init(frame: .zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isAccessibilityElement = true
        accessibilityTraits = .button
        backgroundColor = .hex("#ffffff", 0.2)
        titleLabel.text = symbol
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
    
    static let one = KeyboardButton("1")
    static let two = KeyboardButton("2")
    static let tree = KeyboardButton("3")
    static let four = KeyboardButton("4")
    static let five = KeyboardButton("5")
    static let six = KeyboardButton("6")
    static let seven = KeyboardButton("7")
    static let eight = KeyboardButton("8")
    static let nine = KeyboardButton("9")
    static let zero = KeyboardButton("0")
    static let dot = KeyboardButton(".")
    
    static let clear = KeyboardButton("C")
    static let backspace = KeyboardButton("←")
    static let calculator = KeyboardButton("CAL")

    var isBig: Bool { self == .zero }
    
}
