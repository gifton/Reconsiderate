
import UIKit
import CoreLocation

struct Photo {
    init(photo: UIImage, caption: String?, thoughtIcon: String) {
        self.photo = photo
        self.caption = caption
        self.thoughtIcon = thoughtIcon
    }
    
    
    // MARK: Objects
    var photo: UIImage
    var thoughtIcon: String
    var id: String  = ""
    var caption: String?
    var location: CLLocation?
}

// MARK: Photo SparqComponentConformance
extension Photo: SparqComponent {
    
    var type: SparqType {
        return .photo
    }
    
    var calculatedHeight: CGFloat? {
        return photo.scaled(toWidth: Device.width)?.size.height
    }
    
    init(_ sparq: Sparq) {
        guard let data = sparq.rawPhoto else {
            fatalError("unable to parse sparw")
        }

        if let photo = UIImage(data: data) {
            self.photo = photo
        } else {
            fatalError("unable to parse sparq")
        }

        if let detail = sparq.detail {
            caption = detail
        }
        
        thoughtIcon = sparq.thought.icon
    }
}
