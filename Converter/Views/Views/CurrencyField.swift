import UIKit
import TinyLayout

class CurrencyField: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([button, field], constraints: [
            button.leftAnchor.equal(leftAnchor, scale(10)),
            button.centerYAnchor.equal(centerYAnchor),
            button.heightAnchor.equal(scale(35)),
            button.widthAnchor.equal(scale(80)),
            
            field.leftAnchor.equal(button.rightAnchor, scale(10)),
            field.centerYAnchor.equal(centerYAnchor),
            field.heightAnchor.equal(scale(35)),
            field.rightAnchor.equal(rightAnchor, scale(-10))
        ])
    }
    
    let button = CurrencyButton()
    
    let field = UILabel {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.textAlignment = .right
        $0.text = "1 000 000"
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = .black
    }
    
    var currency: Currency! {
        didSet {
            button.codeLabel.text = currency.code
            button.iconView.image = UIImage(named: currency.imagePath)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class CurrencyButton: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .hex("#ffffff", 0.2)
        //layer.cornerRadius = 10
        addSubviews([iconView, codeLabel], constraints: [
            iconView.leftAnchor.equal(leftAnchor, scale(10)),
            iconView.centerYAnchor.equal(centerYAnchor),
            iconView.widthAnchor.equal(scale(24)),
            iconView.heightAnchor.equal(scale(24)),
            
            codeLabel.leftAnchor.equal(iconView.rightAnchor, scale(10)),
            codeLabel.topAnchor.equal(topAnchor),
            codeLabel.rightAnchor.equal(rightAnchor, scale(-10)),
            codeLabel.bottomAnchor.equal(bottomAnchor)
        ])
    }
    
    let iconView = UIImageView {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray.cgColor
    }
    
    let codeLabel = UILabel {
        $0.textColor = .text
        $0.font = .custom("Menlo-Bold", size: scale(14))
        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
 }

