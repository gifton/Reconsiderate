
import UIKit
import AVFoundation
import CoreLocation

struct Audio {
    init(recording: Data, detail: String?, thoughtIcon: String, location: CLLocation?) {
        self.recording = recording
        self.detail = detail
        self.thoughtIcon = thoughtIcon
        self.location = location
    }
    
    // MARK: Objects
    var recording: Data
    var thoughtIcon: String
    var detail: String?
    var location: CLLocation?
}

extension Audio: SparqComponent {
    var type: SparqType { return .audio }
    var calculatedHeight: CGFloat? { return nil }
    
    init(_ sparq: Sparq) {
        guard let data = sparq.rawRecording else {
            fatalError("Unable to parse sparq")
        }
        
        recording = data
        detail = sparq.detail
        thoughtIcon = sparq.thought.icon
        
    }
}
