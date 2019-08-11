
import Foundation
import CoreData

class HomeViewModel: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
        super.init()

    }
    
    var context: NSManagedObjectContext
    var thoughts: [Thought] = []
    var sparqs: [Sparq] = []
}


// MARK: fetch methods
extension HomeViewModel {
    private func getRecentThoughts() {
        let req = Thought.sortedFetchRequest
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        req.fetchBatchSize = 5
        req.shouldRefreshRefetchedObjects = true
        req.returnsObjectsAsFaults = false
        req.sortDescriptors = [sortDescriptor]
        do {
            thoughts = try context.fetch(req)
        } catch let err {
            print("there was an error fetching: \(err)")
        }
    }
    
    // sparqs
    private func getRecentSparqs() {
        let req = Sparq.sortedFetchRequest
        req.fetchBatchSize = 5
        req.shouldRefreshRefetchedObjects = true
        req.returnsObjectsAsFaults = false
        do {
            sparqs = try context.fetch(req)
        } catch let err {
            print("there was an error fetching: \(err)")
        }
    }
    
    
}
