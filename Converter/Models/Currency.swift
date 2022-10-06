import Foundation

struct Currency {
    
    let code: String
    let title: String
    var imagePath: String {
        "Currencies.bundle/\(code).png"
    }
    
    static let all: [Currency] = [
        Currency(code: "USD", title: "US Dollar"),
        Currency(code: "EUR", title: "Euro"),
        Currency(code: "GEL", title: "Georgian Lari"),
        Currency(code: "GBP", title: "British Pound"),
        Currency(code: "JPY", title: "Japanese Yen"),
        Currency(code: "RUB", title: "Russian Ruble"),
        Currency(code: "CAD", title: "Canadian Dollar"),
        Currency(code: "CNY", title: "Chinese Yuan")
    ]
    
}

