
import Foundation
extension UserDefaults {
    
    enum Keys {
        static let thoughtID     = "ThoughtID"
        static let sparqID       = "SparqID"
        static let name          = "USERname"
        static let email         = "USERemail"
        static let authenticated = "USERauthenticate"
        static let cameraAuth    = "CAMERAAUTHORIZATION"
    }
    
    static func createdNewThought() {
        let defaults = UserDefaults.standard
        let defaultCount = defaults.integer(forKey: UserDefaults.Keys.thoughtID)
        defaults.set(defaultCount + 1, forKey: UserDefaults.Keys.thoughtID)
    }
    static func creatededNewSparq() {
        let defaults = UserDefaults.standard
        let defaultCount = defaults.integer(forKey: UserDefaults.Keys.sparqID)
        defaults.set(defaultCount + 1, forKey: UserDefaults.Keys.sparqID)
    }
    static var thoughtID: String {
        let defaults = UserDefaults.standard
        let num = defaults.integer(forKey: UserDefaults.Keys.thoughtID)
        
        return "rcnsdr-pDBI-T\(num)"
    }
    static var sparqID: String {
        let defaults = UserDefaults.standard
        let num = defaults.integer(forKey: UserDefaults.Keys.sparqID)
        
        return "rcnsdr-pDBI-s\(num)"
    }
}
