
import Foundation

// user defaults handles variable information for saving info to core data
// as well as authentication and authorization for hardware


// thought, sparq, and trait creation requires objects to have unique ID's
// mark creation of new object with calling createdNew func, then retrieving the new IDs


extension UserDefaults {
    
    enum Keys {
        static let thoughtID     = "ThoughtID"
        static let sparqID       = "SparqID"
        static let traitID       = "TraitID"
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
    static func createdTrait() {
        let defaults = UserDefaults.standard
        let defaultCount = defaults.integer(forKey: UserDefaults.Keys.traitID)
        defaults.set(defaultCount + 1, forKey: UserDefaults.Keys.traitID)
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
    static var traitID: String {
        let defaults = UserDefaults.standard
        let num = defaults.integer(forKey: UserDefaults.Keys.traitID)
        
        return "rcnsdr-pDBI-t\(num)"
    }
}
