
import CoreData
import UIKit

@objc(PhotoEntry)
public class Link: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var link: String
    @NSManaged public var detail: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    @NSManaged public var trait: Trait
}

// MARK: Photo SparqComponentConformance
extension Link: SparqComponent {
    var id: String {
        return "LinkSparqComponent"
    }
    
    var type: SparqType {
        return .link
    }
    
    var calculatedHeight: CGFloat? {
        return nil
    }
    
}

// MARK: Photo Managed protocol Conformance
extension Link : Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(Trait.date), ascending: false)]
    }
}
