
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
    
    @NSManaged public var sparqs: NSSet?
}

// MARK: calculated variables
extension Thought {
    //return location as CLLocation
    public var location: CLLocation? {
        guard let lat = latitude, let lon = longitude else { return nil }
        return CLLocation(latitude: lat.doubleValue, longitude: lon.doubleValue)
    }
    
    //build thought components
    static func insert(in context: NSManagedObjectContext, title: String, icon: String, location: CLLocation?) -> Thought {
        
        //set new thought from context
        let thought: Thought = context.insertObject()
        
        // set variables
        thought.date  = Date()
        thought.icon  = icon
        thought.title = title
        thought.id    = UserDefaults.thoughtID
        
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

extension Thought: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
