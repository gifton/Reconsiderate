
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

@objc(Topic)
public class Topic: NSManagedObject {
    
    @NSManaged public var title: String
    @NSManaged public var createdAt: Date
    @NSManaged public var lastUpdate: Date
    
    static func insert(into moc: NSManagedObjectContext, title: String, date: Date) -> Trait {
        let topic: Topic = moc.insertObject()
        
        topic.title = title
        topic.date = date
        topic.lastUpdate = Date()
    }
}


// MARK: managed conformance
extension Topic: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
