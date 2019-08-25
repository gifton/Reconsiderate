
import UIKit

class RecentCellViewModel: NSObject {
    
//    init(withRecentSparqs sparqs: [SparqComponent], andThoughts thoughts: [Thought]) {
//        components = Replicator.randomSparqs()
//        self.thoughts = Replicator.randomThoughts()
//        super.init()
//    }
    
    override init() {
        components = Replicator.randomSparqs()
        self.thoughts = Replicator.randomThoughts()
        super.init()
    }
    
    public var components: [SparqComponent]
    public var thoughts: [Thought]
    
}
