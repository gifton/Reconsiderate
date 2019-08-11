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

@objc(Trait)
public class Trait: NSManagedObject {
    // MARK: Core Data properties
    @NSManaged public var feelings: String
    @NSManaged public var date: Date
    @NSManaged public var icon: String
    @NSManaged public var id: String
    @NSManaged public var medium: Int
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    
    @NSManaged public var sparqs: NSSet?
    
    var computedFeelings: [Feeling] {
        var feelings = [Feeling]()
        let splitString = self.feelings.split(separator: ",")
        for s in splitString {
            guard let f = Feeling(rawValue: String(s)) else { continue }
            feelings.append(f)
        }
        return feelings
    }
}

// MARK ccomputed properties
extension Trait {
    
}

// MARK: Trait conformance to managed protocol
extension Trait: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
