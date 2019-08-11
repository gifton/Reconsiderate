
//import Foundation
//
//struct Topic {
//    var title: String
//    var date: Date
//    var sparqCount: Int?
//    var thoughtCount: Int?
//}



import CoreData
import CoreLocation
import UIKit

@objc(Sparq)
public class Topic: NSManagedObject {
    
    @NSManaged public var title: String
    @NSManaged public var date: Date
    
    
}


// MARK: managed conformance
extension Topic: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
