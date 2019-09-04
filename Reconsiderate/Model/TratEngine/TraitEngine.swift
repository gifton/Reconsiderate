
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
    
    func start() {
        
        // create trait
        let trait: Trait = moc.insertObject()
    
        // set properties
        trait.feelings = getType()
        trait.addFeelings(creator!.feelings)
        trait.medium = creator!.component.type.rawValue
        
        let loc = CLLocation()
        trait.longitude = loc.coordinate.longitude as NSNumber
        trait.latitude = loc.coordinate.latitude as NSNumber
        
        // save context
        save()
        
    }
    
    private func getType() -> String {
        switch component!.type {
        case .audio: return "Audio"
        case .note: return "Note"
        case .photo: return "Photo"
        case .link: return "Link"
        }
    }
    
    private func save() {
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
}
