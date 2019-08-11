
import CoreData
import UIKit

@objc(Audio)
public class Audio: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Audio> {
        return NSFetchRequest<Audio>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var title: String
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    @NSManaged public var trait: Trait
    
    var id: String  = ""
}

extension Audio: SparqComponent {
    var type: SparqType { return .audio }
    var calculatedHeight: CGFloat? { return nil }
}
