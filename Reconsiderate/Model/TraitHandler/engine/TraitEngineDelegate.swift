
import Foundation
import CoreData

// trait engine delegate controlls all publicly facing methods for class

protocol TraitEngineDelegate {
    init(_ moc: NSManagedObjectContext)
    var trait: Trait? { get }
    func start()
}
