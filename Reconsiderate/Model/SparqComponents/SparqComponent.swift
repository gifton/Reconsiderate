import CoreData
import UIKit

enum SparqType {
    case link, photo, audio, note
}

// notes, links, photos, audios all must conform to this
protocol SparqComponent: NSManagedObject & Managed {
    
    var id: String { get }
    var type: SparqType { get }
    var calculatedHeight: CGFloat? { get }
    
}
