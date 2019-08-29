
import UIKit
import CoreData
import CoreLocation

class ReplicatorService: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
    }
    
    var context: NSManagedObjectContext
    
    public func setData() {
        
    }
    
}

// MARK: private building methods for thoughts and sparqs
// thought 1: what is rethought?
    // 2 notes
        // the philosophy
        // what I hope you get out of nigma
    // 2 images
        // screenshots showing where to go for specific things
        // image of dog as examoke
    // 1 link
        // to wesaturate for example
// thought 2: Example 1
// thought 3: example 2
extension ReplicatorService {
    func createWelcomeThought() {
        
        let t = Thought.insert(in: context, title: "Welcome to Nigma!", icon: "💡", location: CLLocation())
        let ns1 = Sparq.insert
        
        
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print("ther was an error saving replicator data: \(error.localizedDescription)")
        }
    }
}
