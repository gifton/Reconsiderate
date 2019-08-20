
import UIKit

class MicroThoughtView: UIView {
    init() {
//        self.thought = thought
        
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: Device.width - 100, height: 36)))
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    var thought: Thought
    
    
    func setView() {
        backgroundColor = Device.colors.lightGray
        layer.cornerRadius = 7
    }
}
