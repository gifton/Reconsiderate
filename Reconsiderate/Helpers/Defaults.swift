
import Foundation
extension UserDefaults {
    
    enum Keys {
        static let thoughtID     = "ThoughtID"
        static let entryID       = "EntryID"
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
    static func creatededNewEntry() {
        let defaults = UserDefaults.standard
        let defaultCount = defaults.integer(forKey: UserDefaults.Keys.entryID)
        defaults.set(defaultCount + 1, forKey: UserDefaults.Keys.entryID)
    }
    static var thoughtID: String {
        let defaults = UserDefaults.standard
        let num = defaults.integer(forKey: UserDefaults.Keys.thoughtID)
        
        return "rcnsdr-pDBI-T\(num)"
    }
    static var currentEntry: String {
        let defaults = UserDefaults.standard
        let num = defaults.integer(forKey: UserDefaults.Keys.entryID)
        
        return "rcnsdr-pDBI-E\(num)"
    }
}
