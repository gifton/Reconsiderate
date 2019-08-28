
import CoreData
import CoreLocation
import UIKit

@objc(Sparq)
public class Sparq: NSManagedObject {
    
    // MARK: entity attributes
    @NSManaged public var id: String
    
    // MARK: entity optional attributes
    @NSManaged public var detail: String?
    @NSManaged public var link: String?
    @NSManaged public var title: String?
    @NSManaged public var rawRecording: Data?
    @NSManaged public var rawPhoto: Data?

    // MARK: entity relationships
    @NSManaged public var trait: Trait
    @NSManaged public var thought: Thought
    
    
    
}

// MARK: computed properties
extension Sparq {

//    var component: SparqComponent {
//        switch trait.medium {
//        case 0: return link!
//        case 1: return photo!
//        case 2: return audio!
//        default: return note!
//        }
//    }
}

// MARK Managed conformance
extension Sparq: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(trait.date), ascending: false)]
    }
}
