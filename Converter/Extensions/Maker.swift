import Foundation

public protocol Maker {}
extension NSObject: Maker {}

extension Maker where Self: NSObject {
    
    init(block: (Self) -> Void) {
        self.init()
        block(self)
    }
    
    public func make(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
}
