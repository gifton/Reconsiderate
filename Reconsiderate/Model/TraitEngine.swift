
import UIKit
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
    required init(_ sparqComponent: SparqComponent, creator: TraitCreator) {
        component = sparqComponent
        self.creator = creator
        isComplete = false
    }
    
    private var component: SparqComponent
    private var creator: TraitCreator
    
    private(set) var trait: Trait?
    
    private(set) var isComplete: Bool
    
    func start(withCompletion completion: @escaping () -> Void) {
        
        
        completion()
    }
    
    private func getTopics() {
        
    }
    private func getFeelings() {
        
    }
}

protocol TraitEngineDelegate {
    init(_ sparqComponent: SparqComponent, creator: TraitCreator)
    var trait: Trait? { get }
    var isComplete: Bool { get }
    func start(withCompletion completion: @escaping () -> Void)
}

protocol TraitCreator {
    var location: CLLocation? { get }
    var feelings: String { get }
    var topics: [Topic] { get }
}
