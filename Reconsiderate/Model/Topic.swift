
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
    
    static func insert(into moc: NSManagedObjectContext, title: String, date: Date) -> Topic {
        let topic: Topic = moc.insertObject()
        
        topic.title = title
        topic.createdAt = date
        topic.lastUpdate = Date()
        
        return topic
    }
    
    // every time a new trait object is created that references this topic
    // call updated() to note the most current occurance of specific topic
    func updated() {
        lastUpdate = Date()
    }
}


// MARK: managed conformance
extension Topic: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }
}
