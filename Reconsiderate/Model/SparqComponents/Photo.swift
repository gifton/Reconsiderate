
import CoreData
import UIKit

@objc(Photo)
public class Photo: NSManagedObject {
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var rawPhoto: Data
    @NSManaged public var detail: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    @NSManaged public var trait: Trait
}

// MARK: Photo SparqComponentConformance
extension Photo: SparqComponent {
    var id: String {
        return "PhotoSparqComponent"
    }
    
    var type: SparqType {
        return .photo
    }
    
    var calculatedHeight: CGFloat? {
        guard let img = UIImage(data: rawPhoto) else { return nil }
        return img.scaled(toWidth: Device.width)?.size.height
    }
    
    
}

// MARK: Photo Managed protocol Conformance
extension Photo: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(Trait.date), ascending: false)]
    }
}
