//struct Trait {
//
//    var feelings:   [feeling]
//    var topics:     [Topic]
//    var date:       Date
//    var medium:     Medium
//    var location:   CLLocation
//    var isInternal: Bool
//
//}





import CoreData
import UIKit
import CoreLocation

@objc(Trait)
public class Trait: NSManagedObject {
    // MARK: Core Data properties
    @NSManaged public var feelings: String
    @NSManaged public var createdAt: Date
    @NSManaged public var id: String
    @NSManaged public var medium: Int
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    
    @NSManaged public var topics: NSSet?
    @NSManaged public var sparqs: NSSet?
    
}

// MARK: computed properties
extension Trait {
    var computedFeelings: [Feeling] {
        var feelings = [Feeling]()
        let splitString = self.feelings.split(separator: ",")
        for s in splitString {
            guard let f = Feeling(rawValue: String(s)) else { continue }
            feelings.append(f)
        }
        return feelings
    }
    var computedMedium: Medium {
        return Medium.forVal(medium)
    }
}

// MARK mutating methods
extension Trait {
    func addFeeling(_ input: Feeling) {
        feelings.append("," + input.rawValue)
    }
}

// MARK: Trait conformance to managed protocol
extension Trait: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }
}

// MARK: Dev will often want to grab all entries related to
// a specific trait component (feeling, medium, icon etc...)
// these funcs gather all sparqs containing the trait

extension Trait {
    
    // find feelings
    static func sparqsContaining(feeling: Feeling) -> [Sparq] {
        // set sorter
        let sorter = NSSortDescriptor(key: "date", ascending: false)
        
        // create predicate
        let pred = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Sparq.trait.feelings), feeling.rawValue)
        
        // create fetch request
        let fetch = NSFetchRequest<Sparq>(entityName: "Sparq")
        fetch.predicate = pred
        fetch.sortDescriptors = [sorter]
        
        let sparqs = [Sparq]()
        return sparqs
    }
    
    // mediums
    static func sparqsContaining(medium: Medium) -> [Sparq] {
        // set sorter
        let sorter = NSSortDescriptor(key: "date", ascending: false)
        
        // create predicate
        let pred = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Sparq.trait.medium), medium.rawValue)
        
        // create fetch request
        let fetch = NSFetchRequest<Sparq>(entityName: "Sparq")
        fetch.predicate = pred
        fetch.sortDescriptors = [sorter]
        
        let sparqs = [Sparq]()
        return sparqs
    }
    
    // topics
    static func sparqsContaining(topic: Topic) -> [Sparq] {
        // set sorter
        let sorter = NSSortDescriptor(key: "date", ascending: false)

        // create predicate
        let pred = NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Sparq.trait.topics), topic.title)

        // create fetch request
        let fetch = NSFetchRequest<Sparq>(entityName: "Sparq")
        fetch.predicate = pred
        fetch.sortDescriptors = [sorter]

        let sparqs = [Sparq]()
        return sparqs
    }
    
    
}

