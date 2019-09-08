
import CoreData
import UIKit
import CoreLocation

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
    var location: CLLocation?
    
}

// MARK: SparqComponent conformance
// TODO: calculate location based on lat and long
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
        timeSince = df.timeSince(from: sparq.trait!.createdAt)
        
        self.title = title
        detail = sparq.detail
        thoughtIcon = sparq.thought.icon
        location = sparq.trait!.location
    }
}
