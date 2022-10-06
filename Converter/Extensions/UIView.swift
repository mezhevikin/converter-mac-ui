import UIKit

public extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var formatted = hex.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")
        let hex = Int(formatted, radix: 16)
        let red = CGFloat(CGFloat((hex! & 0xFF0000) >> 16)/255.0)
        let green = CGFloat(CGFloat((hex! & 0x00FF00) >> 8)/255.0)
        let blue = CGFloat(CGFloat((hex! & 0x0000FF) >> 0)/255.0)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func hex(_ hex: String, _ alpha: CGFloat = 1.0) -> UIColor {
        UIColor(hex: hex, alpha: alpha)
    }
    
}

public extension UITableView {
    
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: "\(type)")
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T {
        dequeueReusableCell(withIdentifier: "\(type)") as! T
    }
    
    func scrollToTop(animated: Bool = false) {
        if numberOfRows(inSection: 0) > 0 {
            scrollToRow(
                at: .init(row: 0, section: 0),
                at: .top,
                animated: animated
            )
        }
    }
    
}

public extension UITableViewCell {
    
    func setBackgroundColor(_ normal: UIColor, selected: UIColor) {
        backgroundColor = normal
        let view = UIView()
        view.backgroundColor = selected
        selectedBackgroundView = view
    }
    
    func setLeftSeparatorPadding(_ padding: CGFloat) {
        separatorInset = UIEdgeInsets(
            top: 0,
            left: padding,
            bottom: 0,
            right: 0
        )
    }
    
}

public extension UIImageView {
    
    func setIcon(_ icon: String, color: UIColor) {
        if let image = UIImage(named: icon) {
            setImage(image, color: color)
        }
    }
    
    func setImage(_ image: UIImage, color: UIColor) {
        tintColor = color
        self.image = image.withRenderingMode(.alwaysTemplate)
    }
    
}

public extension UIFont {
    
    static func system(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        boldSystemFont(ofSize: size)
    }
    
    static func custom(_ name: String, size: CGFloat) -> UIFont? {
        UIFont(name: name, size: size)
    }
    
}

public extension UIControl {
    
    func addTarget(_ target: Any?, _ action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
    
}

public extension NSTextAlignment {
    
    static var inverse: NSTextAlignment {
        UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .left : .right
    }
    
}
