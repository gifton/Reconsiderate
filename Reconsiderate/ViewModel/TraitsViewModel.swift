
import CoreData
import Foundation

class TraitsViewModel: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
        super.init()
    }
    
    var context: NSManagedObjectContext
    var topics: [Topic] = []
}


// MARK: ViewModel fetching methods
extension TraitsViewModel {
    func fetchTopics() {
        
        // set request and descriptor
        let req = Topic.sortedFetchRequest
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        // req params update
        req.shouldRefreshRefetchedObjects = true
        req.returnsObjectsAsFaults = false
        req.sortDescriptors = [sortDescriptor]
        
        // fetch
        do {
            try topics = context.fetch(req)
        } catch let err {
            // catch
            print("there was an error fetching: \(err)")
        }
    }
    
}
