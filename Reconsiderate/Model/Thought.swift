
import CoreData
import UIKit
import CoreLocation

@objc(Thought)
public class Thought: NSManagedObject {
    // MARK: Core Data properties
    @NSManaged public var title: String
    @NSManaged public var date: Date
    @NSManaged public var icon: String
    @NSManaged public var id: String
    @NSManaged public var latitude: NSNumber?
    @NSManaged public var longitude: NSNumber?
    @NSManaged public var isPersonal: Bool
    
    @NSManaged public var sparqs: NSSet?
    
    var computedSparqs: [Sparq] {
        
        var computedSparqs = [Sparq]()
        
        guard let iSparqs = sparqs else { return computedSparqs}
        
        for sparq in iSparqs {
            guard let s: Sparq = sparq as? Sparq else { continue }
            computedSparqs.append(s)
        }
        
        return computedSparqs
    }
}

// MARK: computed properties
extension Thought {
    //return location as CLLocation
    public var location: CLLocation? {
        guard let lat = latitude, let lon = longitude else { return nil }
        return CLLocation(latitude: lat.doubleValue, longitude: lon.doubleValue)
    }
    
    // sparq count from last week
    public var sparqCountFromPastWeek: Int {
        let lastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!
        var count = 0
        computedSparqs.forEach {
            if $0.createdAt >= lastWeekDate { count += 1 }
        }
        
        return count
    }
}

// MARK: static initializer
extension Thought {
    
    //build thought components
    static func insert(in context: NSManagedObjectContext, title: String, icon: String, location: CLLocation?, isPersonal: Bool = false) -> Thought {
        
        //set new thought from context
        let thought: Thought = context.insertObject()
        
        // set variables
        thought.isPersonal = isPersonal
        thought.title      = title
        thought.date       = Date()
        thought.icon       = icon
        thought.id         = UserDefaults.thoughtID
        
        //save location if available
        if let loc: CLLocation = location {
            thought.latitude  = loc.coordinate.latitude as NSNumber
            thought.longitude = loc.coordinate.longitude as NSNumber
        }
        
        // update userdefaults with thought num
        UserDefaults.createdNewThought()
        
        return thought
    }
}

// MARK: Thoguht conformance to managed
extension Thought: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
