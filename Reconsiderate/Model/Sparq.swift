
import CoreData
import CoreLocation
import UIKit

@objc(Entry)
public class Sparq: NSManagedObject {
    
    // MARK: Core Data properties
//    @NSManaged public var id: String
//    @NSManaged public var date: Date
//    @NSManaged public var latitude: NSNumber?
//    @NSManaged public var longitude: NSNumber?
//    @NSManaged public var type: String

    @NSManaged public var trait: Trait
    @NSManaged public var component: SparqComponent
    @NSManaged public var thought: Thought
}

// MARK: computed properties
extension Sparq {
    
}
