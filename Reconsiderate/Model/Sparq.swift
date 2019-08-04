
import CoreData
import CoreLocation
import UIKit

@objc(Entry)
public class Sparq: NSManagedObject {

    @NSManaged public var trait: Trait
//    @NSManaged public var component: SparqComponent
    @NSManaged public var thought: Thought
    
    var component: SparqComponent {
        switch trait.medium {
        case 0:
            <#code#>
        default:
            <#code#>
        }
    }
}

// MARK: computed properties
extension Sparq {
    
}
