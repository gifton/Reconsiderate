
import CoreData
import CoreLocation
import UIKit

@objc(Sparq)
public class Sparq: NSManagedObject {

    @NSManaged public var trait: Trait
    @NSManaged public var thought: Thought
    @NSManaged public var note: Note?
    @NSManaged public var link: Link?
    @NSManaged public var audio: Audio?
    @NSManaged public var photo: Photo?
    
}

// MARK: computed properties
extension Sparq {

    var component: SparqComponent {
        switch trait.medium {
        case 0: return link!
        case 1: return photo!
        case 2: return audio!
        default: return note!
        }
    }
}
