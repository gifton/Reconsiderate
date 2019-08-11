
import CoreData
import Foundation

class TraitsViewModel: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
        super.init()
    }
    
    var context: NSManagedObjectContext
}


// MARK: ViewModel fetching methods
extension TraitsViewModel {
    func fetchTopics() {
        
    }
    
}
