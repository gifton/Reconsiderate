
import Foundation


// recent cell view model handless distribution of recent Thoughts and Entries
// when tapped, before moving to the next screen in coordinator, call sparqFor(index:) or thoughtFor(index:) to return full object for
// detail controller

class RecentCellViewModel {
    
    
    init(_ sparqs: [Sparq], _ thoughts: [Thought]) {
        
        self.sparqs = sparqs
        self.thoughts = thoughts
        
    }
    
    // MARK: private vars
    private var sparqs: [Sparq] {
        didSet {
            sparqComponents = sparqs.components()
        }
    }
    
    private var thoughts: [Thought] {
        didSet {
            thoughtPreviews = ThoughtPreview.sequence(thoughts)
        }
    }
    
    // MARK: public vars
    public var sparqComponents: [SparqComponent] = []
    public var thoughtPreviews: [ThoughtPreview] = []
    
}

// MARK: RecentCellViewModel retrieval functions
extension RecentCellViewModel {
    // retrieve sparq for index if index is valid
    public func sparq(forIndex idx: Int) -> Sparq {
        
        return sparqs[idx]
        
    }
    
    public func thought(forIndex idx: Int) -> Thought {
        return thoughts[idx]
    }
}

// TODO: Consider refressh method
