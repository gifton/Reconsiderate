import CoreData

// container for loading application into Core data context
func createThoughtContainer(completion: @escaping (NSPersistentContainer) -> Void) {
    let container = NSPersistentContainer(name: "rcnsdr-pDB3")
    container.loadPersistentStores { (_, error) in
        guard error == nil else { fatalError("failed to load store: \(error!)")}
        DispatchQueue.main.async {
            completion(container)
        }
    }
}
