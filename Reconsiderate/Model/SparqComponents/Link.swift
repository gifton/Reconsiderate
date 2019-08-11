
import CoreData
import UIKit

@objc(Link)
public class Link: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var link: String
    @NSManaged public var detail: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    
    var id: String  = ""
}

// MARK: Photo SparqComponentConformance
extension Link: SparqComponent {
    
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
        return [NSSortDescriptor(key: #keyPath(sparq.trait.date), ascending: false)]
    }
}
