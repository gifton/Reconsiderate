
import Foundation
import CoreData
import CoreLocation

// creating a new thought
// fetching recent thoughts / sparqs

class HomeViewModel: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
        super.init()
        thoughts = Thought.fetch(in: context)
        print("thought view model set")
    }
    
    var context: NSManagedObjectContext
    var thoughts: [Thought] = [] 
    var sparqs: [Sparq] = []
}


// MARK: fetch methods
extension HomeViewModel {
    
    // thoughts
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
        do  { try context.save() } catch { print(error)}
    }
}

// MARK: vm creation methods
extension HomeViewModel {
    
    func initiateRecentModel() -> RecentCellViewModel {

        let vm = RecentCellViewModel(sparqs, thoughts)

        return vm

    }
    
    func initiateContainerCell() -> HomeContainerViewModel {
        let vm = HomeContainerViewModel(withContext: context)

        return vm
    }
    
}

// MARK: vm content gathering methods
extension HomeViewModel {
    
    
}
