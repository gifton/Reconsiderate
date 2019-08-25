
import CoreData
import UIKit

@objc(Photo)
public class Photo: NSManagedObject {
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "PhotoEntry")
    }
    
    
    // MARK: Objects
    @NSManaged public var rawPhoto: Data
    @NSManaged public var caption: String?
    
    // MARK: Relationship
    @NSManaged public var sparq: Sparq
    
    var id: String  = ""
}

// MARK: Photo SparqComponentConformance
extension Photo: SparqComponent {
    
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
        return [NSSortDescriptor(key: #keyPath(sparq.trait.date), ascending: false)]
    }
}
