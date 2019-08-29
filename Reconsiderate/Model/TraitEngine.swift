
import UIKit

class TraitEngine: TraitEngineDelegate {
    required init(_ sparqComponent: SparqComponent) {
        <#code#>
    }
    
    private(set) var trait: Trait?
    
    private(set) var isComplete: Bool
    
    func start(withCompletion completion: @escaping () -> Void) {
        
        
        completion()
    }
    
    
}

protocol TraitEngineDelegate {
    init(_ sparqComponent: SparqComponent)
    var trait: Trait? { get }
    var isComplete: Bool { get }
    func start(withCompletion completion: @escaping () -> Void)
}
