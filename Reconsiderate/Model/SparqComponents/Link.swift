
import CoreData
import UIKit

@objc(Link)
public class Link: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "Link")
    }
    
    
    // MARK: Objects
    @NSManaged public var link: String
    @NSManaged public var detail: String?
    @NSManaged public var websiteDescription: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    
    var id: String  = ""
    
    // MARK static building func
    static func insert(into context: NSManagedObjectContext, withLink url: String, andLinkDescription description: String, andDetail detail: String, forSparq sparq: Sparq) -> Link {
        
        // set variables from builder
        let link: Link = context.insertObject()
        
        link.detail = detail
        link.websiteDescription = description
        link.link = url
        link.sparq = sparq
        
        return link
    }
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
extension Link: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(sparq.trait.date), ascending: false)]
    }
}
