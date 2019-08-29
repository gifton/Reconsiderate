import CoreData
import UIKit

enum SparqType: Int {
    case link = 0
    case photo = 1
    case audio = 2
    case note = 3
}

// notes, links, photos, audios all must conform to this
protocol SparqComponent {
    
    var type: SparqType { get }
    var thoughtIcon: String { get set}
    var calculatedHeight: CGFloat? { get }
    
    init(_ sparq: Sparq)
}
