
import UIKit

struct Link {
    init(url: URL, websiteDescription: String, detail: String, thoughtIcon: String) {
        self.url = url
        self.websiteDescription = websiteDescription
        self.detail = detail
        self.thoughtIcon = thoughtIcon
    }
    
    var url: URL
    var websiteDescription: String
    var thoughtIcon: String
    var detail: String?
}

// MARK: Link SparqComponent conformance
extension Link: SparqComponent {
    init(_ sparq: Sparq) {
        guard let link: URL = URL(string: sparq.link!) else {
            fatalError("Unable to parse sparq")
        }
        url = link
        websiteDescription = ""
        
        detail = sparq.detail
        thoughtIcon = sparq.thought.icon
    }
    
    var calculatedHeight: CGFloat? {
        return nil
    }
    var type: SparqType {
        return .link
    }
}
