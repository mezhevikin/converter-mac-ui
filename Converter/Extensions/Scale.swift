import UIKit

public class Scale {
    
     static public var factor: CGFloat = {
        if UIDevice.isMac { return 1 }
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let size = [
            min(width, height),
            max(width, height)
        ]
        let factors: [Array<CGFloat>: CGFloat] = [
            [320, 568]: 1,
            [375, 667]: 1.171,
            [375, 812]: 1.171,
            [414, 736]: 1.293,
            [414, 896]: 1.293,
            [744, 1133]: 1.4,
            [768, 1024]: 1.4,
            [810, 1080]: 1.4,
            [820, 1180]: 1.4,
            [834, 1194]: 1.4,
            [834, 1112]: 1.4,
            [1024, 1366]: 1.7
        ]
        let min: CGFloat = UIDevice.isPhone ? 320 : 768
        return factors[size] ?? width / min
    }()
    
}

func scale(_ number: CGFloat) -> CGFloat {
    number * Scale.factor
}

