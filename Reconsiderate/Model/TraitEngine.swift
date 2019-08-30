
import UIKit
import CoreData
import CoreLocation

//    var feelings:   [feeling]
//    var topics:     [Topic]
//    var date:       Date
//    var medium:     Medium
//    var location:   CLLocation
//    var isInternal: Bool


// trait engine handles gathering individual components, sparqs
// producing a trait object
// feelings: manually inputed for now
// topics manually added for now
// internal manually added for now



class TraitEngine: TraitEngineDelegate {

    required init(_ moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    public var component: SparqComponent? {
        didSet {
            
        }
    }
    private var creator: TraitCreator?
    private var moc: NSManagedObjectContext
    
    private(set) var trait: Trait?
    private(set) var isComplete: Bool = false
    
    func start(withCompletion completion: @escaping () -> Void) {
        
        // create trait
        let trait: Trait = moc.insertObject()
    
        // set properties
        
        // save context
        
        completion()
    }
    
}
