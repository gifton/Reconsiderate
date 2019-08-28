
import UIKit

struct Link {
    init(url: URL, description: String, detail: String) {
        self.url = url
        self.description = description
        self.detail = detail
    }
    
    var url: URL
    var description: String
    var detail: String
}

// MARK: Link SparqComponent conformance
extension Link: SparqComponent {
    init(_ sparq: Sparq) {
        guard let link: URL = URL(string: sparq.link!),
            let detail = sparq.detail else {
            fatalError("Unable to parse sparq")
        }
        url = link
        description = ""
        
        self.detail = detail
    }
    
    var calculatedHeight: CGFloat? {
        return nil
    }
    var type: SparqType {
        return .link
    }
}
