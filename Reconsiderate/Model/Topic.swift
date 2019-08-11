
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
