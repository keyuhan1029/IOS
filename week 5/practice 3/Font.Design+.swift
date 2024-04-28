import SwiftUI

extension Font.Design: RawRepresentable {
    public init?(rawValue: Int) {
        let allDesign = [Font.Design.serif, .rounded, .monospaced]
        
        for design in allDesign {
            if design.rawValue == rawValue {
                self = design
                return
            }
        }
        
        self = .default
    }
    
    public var rawValue: Int {
        switch self {
            case .default: 0
            case .serif: 1
            case .rounded: 2
            case .monospaced: 3
            @unknown default: 0
        }
    }
}
