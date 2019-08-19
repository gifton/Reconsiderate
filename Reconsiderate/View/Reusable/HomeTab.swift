
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
        backgroundColor = .black
    }
}
