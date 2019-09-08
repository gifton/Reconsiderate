
import UIKit

// newSparq button holds a single sparq type and an icon
class NewSparqButton: UIView {
    init(_ type: SparqType, point: CGPoint) {
        self.type = type
        super.init(frame: CGRect(origin: point, size: CGSize(width: 125, height: 125)))
        style()
        setReaction()
    }
    
    // MARK: private vars
    private var type: SparqType
    private var holdGesture: UILongPressGestureRecognizer!
    private var label: String {
        switch type {
        case .audio: return "audio"
        case .photo: return "photo"
        case .note: return "note"
        case .link: return "link"
        }
    }
    
    private var icon: UIImage {
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
    
    private func style() {
        // view
        backgroundColor = Device.colors.lightGray
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        // image
        let iconView = UIImageView(image: icon)
        iconView.frame.size = CGSize(width: 25, height: 25)
        iconView.contentMode = .scaleAspectFit
        
        // text
        let lbl = UILabel(label)
        lbl.sizeToFit()
        lbl.center.x = center.x
        lbl.bottom = bottom - 30
        
        // add subviews
        addSubview(iconView)
        addSubview(lbl)
    }
    
    private func setReaction() {
        holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapped(_:)))
        addGestureRecognizer(holdGesture)
    }
    
    
    @objc
    func tapped(_ sender: Any?) {
        backgroundColor = Device.colors.darkGray
    }
    
    deinit {
        removeGestureRecognizer(holdGesture)
    }
}
