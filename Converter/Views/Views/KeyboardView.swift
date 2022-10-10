import UIKit

class KeyboardView: UIStackView {
    
    let leftItems: [KeyboardItem] = [
        .clear,
        .backspace,
        .calculator
    ]
    
    let rightItems: [[KeyboardItem]] = [
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .tree],
        [.zero, .dot]
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        //distribution = .fillEqually
        spacing = scale(10)
        addArrangedSubview(leftRowView)
        addArrangedSubview(rightRowView)
    }
    
    lazy var leftRowView = UIStackView {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = scale(10)
        for item in leftItems {
            let button = KeyboardButton(item: item)
            $0.addArrangedSubview(button)
        }
    }
    
    lazy var rightRowView = UIStackView {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = scale(10)
        for row in rightItems {
            let rowView = UIStackView()
            rowView.translatesAutoresizingMaskIntoConstraints = false
            rowView.axis = .horizontal
            rowView.distribution = .fillEqually
            rowView.spacing = scale(10)
            for item in row {
                let button = KeyboardButton(item: item)
                rowView.addArrangedSubview(button)
            }
            $0.addArrangedSubview(rowView)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init")
    }
    
}

struct KeyboardItem: Hashable  {
    
    let symbol: String
    
    init(_ symbol: String) {
        self.symbol = symbol
    }
    
    static let one = KeyboardItem("1")
    static let two = KeyboardItem("2")
    static let tree = KeyboardItem("3")
    static let four = KeyboardItem("4")
    static let five = KeyboardItem("5")
    static let six = KeyboardItem("6")
    static let seven = KeyboardItem("7")
    static let eight = KeyboardItem("8")
    static let nine = KeyboardItem("9")
    static let zero = KeyboardItem("0")
    static let dot = KeyboardItem(".")
    
    static let clear = KeyboardItem("C")
    static let backspace = KeyboardItem("←")
    static let calculator = KeyboardItem("CAL")

    var isBig: Bool { self == .zero }
    
}
