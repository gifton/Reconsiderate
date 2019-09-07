
import UIKit

// newSparq button holds a single sparq type and an icon
class NewSparqButton: UIView {
    init(_ type: SparqType, point: CGPoint) {
        self.type = type
        super.init(frame: CGRect(origin: point, size: CGSize(width: 125, height: 125)))
        
    }
    
    var type: SparqType
    
    var icon: UIImage {
        switch type {
        case .audio: return #imageLiteral(resourceName: "microphone")
        case .photo: return #imageLiteral(resourceName: "photo")
        case .note: return #imageLiteral(resourceName: "note")
        case .link: return #imageLiteral(resourceName: "link")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styleView() {
        
    }
    
}
