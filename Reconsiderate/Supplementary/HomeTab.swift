
import UIKit

enum HomeTabType: String {
    case thought = "Thoughts"
    case sparq = "Sparqs"
    case settings = "Settings"
    case traits = "Traits"
    case me = "me"
    
    static var exhastive: [HomeTabType] {
        return [.me, .thought, .sparq, .traits, .settings]
    }
}

class HomeTab: UIView {
    init(_ type: HomeTabType) {
        self.type = type
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: Device.width - 80, height: 35)))
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var icon = UIImageView()
    var title = UILabel()
    
    var type: HomeTabType
    
    func setView() {
        title.text = type.rawValue
        
        switch type {
        case .me: icon.image = #imageLiteral(resourceName: "me")
        case .thought: icon.image = #imageLiteral(resourceName: "cloud")
        case .sparq: icon.image = #imageLiteral(resourceName: "lightbulb")
        case .traits: icon.image = #imageLiteral(resourceName: "chart-network")
        case .settings: icon.image = #imageLiteral(resourceName: "cog")
        }
        
        title.sizeToFit()
        title.left = left + 40
        title.centerY = centerY
        
        icon.sizeToFit()
        icon.frame = CGRect(x: 10, y: 5, width: 20, height: 24)
        icon.contentMode = .scaleAspectFit
        
        addSubview(icon)
        addSubview(title)
    }
    
    @objc
    private func didPress(_ sender: Any) {
        print("tap, tap, tap, tap.")
        backgroundColor = .black
        title.textColor = .white
    }
    
    @objc
    private func didReleasePress(_ sender: Any) {
        backgroundColor = .white
        title.textColor = .black
    }
    
    private func addGesture() {
        isUserInteractionEnabled = true
        let gesture = UIGestureRecognizer(target: self, action: #selector(didPress(_:)))
        addGestureRecognizer(gesture)
    }
}
