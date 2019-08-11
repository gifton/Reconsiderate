
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var title: String
    @NSManaged public var detail: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    var id: String  = ""
}

// MARK: Photo SparqComponentConformance
extension Note: SparqComponent {
    
    var type: SparqType {
        return .note
    }
    
    var calculatedHeight: CGFloat? {
        return nil
    }
    
}

// MARK: Photo Managed protocol Conformance
extension Note: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(sparq.trait.date), ascending: false)]
    }
}
