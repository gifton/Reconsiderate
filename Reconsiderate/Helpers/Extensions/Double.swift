
import Foundation

public extension Double {
    
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random:Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }
    
    /**
     Create a random number Double
     
     - parameter min: Double
     - parameter max: Double
     
     - returns: Double
     */
    static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}
    
