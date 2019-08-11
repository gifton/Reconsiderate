
import Foundation
import CoreData
import CoreLocation

// HomeView conrolls three aspects:
// navigation
// creating a new thought
// viewing recent thoughts / sparqs

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
    
    public func createThought(withTitle title: String, andIcon icon: String) {
        _ = Thought.insert(in: context, title: title, icon: icon, location: CLLocation())
        do { try context.save() } catch { print(error)}
    }
}
