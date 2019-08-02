//struct Trait {
//
//    var feelings:   [feeling]
//    var topics:     [Topic]
//    var date:       Date
//    var medium:     Medium
//    var location:   CLLocation
//    var isInternal: Bool
//
//}





import CoreData
import UIKit
import CoreLocation

@objc(Thought)
public class Trait: NSManagedObject {
    // MARK: Core Data properties
    @NSManaged public var feelings: String
    @NSManaged public var date: Date
    @NSManaged public var icon: String
    @NSManaged public var id: String
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    
    @NSManaged public var sparqs: NSSet?
    
    var computedFeelings: [feeling] {
        return [.calmness]
    }
}

// MARK ccomputed properties
extension Trait {
    
}
