
import Foundation

// trait creator protocol connects trait engine with whatever viewModel / controller
// trait engine calculates the Trait oibject from its delegate (TraitCreators) accessable variables


//    var feelings: [feeling]
//    var topics: [Topic]
//    var isInternal: Bool

protocol TraitCreator {
    var feelings: [Feeling] { get }
    var topics: [Topic] { get }
    var component: SparqComponent { get }
    var isInternal: Bool { get }
}

