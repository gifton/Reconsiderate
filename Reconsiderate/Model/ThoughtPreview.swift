
import UIKit
import CoreLocation

// - ThoughtPreview lets us view info about thought
//   without having to move core data object around
//   thought preview does not have any connection to sarq
// paramss are individual thought components, or Thought NSManaged Object

struct ThoughtPreview {
    
    // MARK: objects
    var title: String
    var id: String
    var createdAt: Date
    var icon: String
    var totalSparqs: Int
    var sparqsThisWeek: Int
    
    init(_ thought: Thought) {
        title = thought.title
        id = thought.id
        createdAt = thought.date
        icon = thought.icon
        totalSparqs = thought.computedSparqs.count
        sparqsThisWeek = thought.sparqCountFromPastWeek
        
    }
    
    // return collection of ThoughtPreviews
    // params - [Thought]
    static func sequence(_ thoughts: [Thought]) -> [ThoughtPreview] {
        var tp = [ThoughtPreview]()
        thoughts.forEach { (t) in
            tp.append(ThoughtPreview(t))
        }
        
        return tp
    }
}
