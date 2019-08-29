
import CoreData
import UIKit

// note object converts the Sparq objcet into desired outputs

struct Note {
    init(title: String, detail: String, timeSince: String, thoughtIcon: String) {
        self.title = title
        self.detail = detail
        self.timeSince = timeSince
        self.thoughtIcon = thoughtIcon
    }
    
    var title: String
    var detail: String?
    var timeSince: String
    var thoughtIcon: String
    
}

// MARK: SparqComponent conformance
extension Note: SparqComponent {
    var type: SparqType {
        return .note
    }
    
    var calculatedHeight: CGFloat? {
        return nil
    }
    
    init(_ sparq: Sparq) {
        // since all content except trait and ID are optional, guard into proper objects, throw fatal error since data is corrupt
        guard let title = sparq.title else {
            fatalError("sparq object could not be parsed")
        }
        
        let df = DateFormatter()
        timeSince = df.timeSince(from: sparq.trait.date)
        
        self.title = title
        self.detail = sparq.detail
        self.thoughtIcon = sparq.thought.icon
    }
}
