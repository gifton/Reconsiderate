
import CoreData
import UIKit

@objc(PhotoEntry)
public class Note: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var title: String
    @NSManaged public var detail: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    @NSManaged public var trait: Trait
}

// MARK: Photo SparqComponentConformance
extension Note: SparqComponent {
    var id: String {
        return "NoteSparqComponent"
    }
    
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
        return [NSSortDescriptor(key: #keyPath(Trait.date), ascending: false)]
    }
}
