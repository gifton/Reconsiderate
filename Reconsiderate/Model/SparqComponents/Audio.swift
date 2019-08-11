
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
}

extension Audio: SparqComponent {
    var id: String { return "" }
    var type: SparqType { return .audio }
    var calculatedHeight: CGFloat? { return nil }
}
