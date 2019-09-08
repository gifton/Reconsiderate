
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
    
    @NSManaged public var traits: NSSet?
    
    static func insert(into moc: NSManagedObjectContext, title: String, for trait: Trait) -> Topic {
        
        // check if topic already exists
        if let t = find(topicWithName: title, in: moc) {
            // update t to new date
            t.updated()
            t.addToTrait(trait)
            return t
        }
        
        // create and return topic otherwise
        let topic: Topic = moc.insertObject()
        
        topic.title = title
        topic.createdAt = Date()
        topic.lastUpdate = Date()
        
        topic.addToTrait(trait)
        
        return topic
    }
    
    @objc(addTraitObject:)
    @NSManaged public func addToTrait(_ value: Trait)
    
    @objc(removeTraitObject:)
    @NSManaged public func removeFromTrait(_ value: Trait)
    
    // adding topic to trait
//    func addTraitToSet(_ trait: Trait) {
//        // get list of traits
//        let traits = Topic.mutableSetValue(forKey: #keyPath(Topic.traits))
//
//        // determin if desired trait is already in set
//        let out = traits.filter { (t) -> Bool in
//            let tt = t as? Trait
//            return tt?.id == trait.id
//        }
//
//        // if it doesnt exist, add to set
//        if out.count == 0 {
//            traits.add(trait)
//        }
//    }
    
    // every time a new trait object is created that references this topic
    // call updated() to note the most current occurance of specific topic
    func updated() {
        lastUpdate = Date()
    }
    
    // find if topic already exists
    static func find(topicWithName name: String, in context: NSManagedObjectContext) -> Topic? {
        // set sorter
        let sorter = NSSortDescriptor(key: "title", ascending: false)
        
        // create predicate
        let pred = NSPredicate(format: "%K ==[cd] %@", #keyPath(title), name)
        
        // create fetch request
        let fetch = NSFetchRequest<Topic>(entityName: "Topic")
        fetch.predicate = pred
        fetch.sortDescriptors = [sorter]
        
        do {
            let out = try context.fetch(fetch)
            if out.first?.title == name {
                return out.first
            }
        } catch {
            print(error)
            return nil
        }
        
        return nil
    }
}


// MARK: managed conformance
extension Topic: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }
}
