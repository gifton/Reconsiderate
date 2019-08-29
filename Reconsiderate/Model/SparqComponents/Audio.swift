
import UIKit
import AVFoundation
struct Audio {
    init(recording: Data, detail: String?, thoughtIcon: String) {
        self.recording = recording
        self.detail = detail
        self.thoughtIcon = thoughtIcon
    }
    
    // MARK: Objects
    var recording: Data
    var thoughtIcon: String
    var detail: String?
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
