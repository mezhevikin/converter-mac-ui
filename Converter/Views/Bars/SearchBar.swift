import UIKit
import TinyLayout

class SearchBar: UIView, UITextFieldDelegate {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        textField.addTarget(
            self,
            action: #selector(search(field:)),
            for: .editingChanged
        )
        cancelButton.addTarget(self, #selector(cancel))
        
        textFieldContainer.addSubview(textField)
        addSubviews([
            textFieldContainer,
            cancelButton
        ], constraints: cons())
    }
    
    func cons() -> [NSLayoutConstraint] {
        [
            textFieldContainer.leadingAnchor.equal(leadingAnchor, scale(15)),
            textFieldContainer.topAnchor.equal(topAnchor),
            textFieldContainer.bottomAnchor.equal(bottomAnchor, -scale(10)),
            
            textField.leadingAnchor.equal(textFieldContainer.leadingAnchor, scale(15)),
            textField.topAnchor.equal(textFieldContainer.topAnchor),
            textField.bottomAnchor.equal(textFieldContainer.bottomAnchor),
            textField.trailingAnchor.equal(textFieldContainer.trailingAnchor, -scale(15)),
            
            hiddenCancel,
            cancelButton.topAnchor.equal(textFieldContainer.topAnchor),
            cancelButton.bottomAnchor.equal(textFieldContainer.bottomAnchor),
            cancelButton.trailingAnchor.equal(trailingAnchor, -scale(15)),
            cancelButton.widthAnchor.equal(cancelButton.frame.width)
        ]
    }
    
    var delegate: SearchBarDelegate!
    
    private lazy var hiddenCancel: NSLayoutConstraint = {
        textFieldContainer.trailingAnchor.equal(trailingAnchor, -scale(15))
    }()
    
    private lazy var visibleCancel: NSLayoutConstraint = {
        cancelButton.leadingAnchor.equal(textFieldContainer.trailingAnchor, scale(15))
    }()
    
    let textFieldContainer = UIView {
        $0.backgroundColor = .hex("#ffffff", 0.1)
        $0.layer.cornerRadius = scale(10)
    }
    
    let textField = UITextField {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.autocorrectionType = .no
        $0.font = .system(scale(16))
        $0.textColor = .text
        $0.tintColor = .tint
        $0.attributedPlaceholder = NSAttributedString(
            string: l("Search"),
            attributes: [
               .foregroundColor: UIColor.subtext
            ]
        )
    }
    
    let cancelButton = UIButton {
        $0.setTitle(l("Cancel"), for: .normal)
        $0.setTitleColor(.tint, for: .normal)
        $0.titleLabel?.font = .system(scale(16))
        $0.isHidden = true
        $0.sizeToFit()
    }
    
    @objc func cancel() {
        textField.resignFirstResponder()
        textField.text = ""
        search(field: textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.cancelButton.isHidden = false
            self.hiddenCancel.isActive = false
            self.visibleCancel.isActive = true
            self.layoutIfNeeded()
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.cancelButton.isHidden = true
            self.visibleCancel.isActive = false
            self.hiddenCancel.isActive = true
            self.layoutIfNeeded()
        }
    }
    
    @objc func search(field: UITextField) {
        if let delegate {
            delegate.search(text: field.text!)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
}

protocol SearchBarDelegate {
    func search(text: String)
}
