
//
//    var feelings:   [feeling]
//    var topics:     [Topic]
//    var date:       Date
//    var medium:     Medium
//    var location:   CLLocation
//    var isInternal: Bool
//


import CoreData
import UIKit
import CoreLocation

@objc(Trait)
public class Trait: NSManagedObject {
    
    // MARK: Core Data properties
    @NSManaged public var createdAt: Date
    @NSManaged public var isPersonal: Bool
    @NSManaged public var id: String
    @NSManaged public var medium: Int
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    @NSManaged public var feelings: String?
    
    @NSManaged public var topics: NSSet?
    @NSManaged public var sparq: Sparq
    
}

// MARK: computed properties
extension Trait {
    // feelings are saved as strings seperated by commas, convert into Feeling object
    var computedFeelings: [Feeling]? {
        
        // if there are no feelings, return empty string
        guard let feelings = feelings else { return nil }
        var computedFeelings = [Feeling]()
        
        // split feelings by comma
        let splitString = feelings.split(separator: ",")
        for s in splitString {
            // feeling can be created from raw string, (throws error if not found), continue to next
            guard let f = Feeling(rawValue: String(s)) else { continue }
            computedFeelings.append(f)
        }
        return computedFeelings
    }
    
    // return computed medium from saved integer
    var computedMedium: Medium {
        return Medium.forVal(medium)
    }
    
    //return location as CLLocation
    public var location: CLLocation? {
        guard let lat = latitude, let lon = longitude else { return nil }
        return CLLocation(latitude: lat.doubleValue, longitude: lon.doubleValue)
    }
    
    static func insert(into moc: NSManagedObjectContext, with feelings: [Feeling], for sparq: Sparq, isPersonal: Bool = false) -> Trait {
        
        let trait: Trait = moc.insertObject()
        
        // internally calculated objects
        trait.createdAt = Date()
        UserDefaults.createdTrait()
        trait.id = UserDefaults.traitID
        
        //save location if available
        let loc = CLLocation()
        trait.latitude  = loc.coordinate.latitude as NSNumber
        trait.longitude = loc.coordinate.longitude as NSNumber
        
        
        // parameter variables
        trait.addFeelings(feelings)
        trait.isPersonal = isPersonal
        
        return trait
    }
}

// MARK mutating methods
extension Trait {
    func addFeeling(_ input: Feeling) {
        if feelings != nil {
            feelings! += input.rawValue
        } else {
            feelings = input.rawValue
        }
        
    }
    func addFeelings(_ input: [Feeling]) {
        for i in input {
            addFeeling(i)
        }
        
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

