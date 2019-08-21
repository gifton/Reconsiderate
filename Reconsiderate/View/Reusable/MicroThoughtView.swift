
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
    
    private var icon = UILabel(String.randomEmoji())
    private var title = UILabel("290 sparqs")
    private var date = UILabel()
    
    func setView() {
        backgroundColor = Device.colors.lightGray
        layer.cornerRadius = 7
        
        // icon
        icon.frame = CGRect(x: Device.padding.medium.rawValue, y: 2, width: 25, height: 32)
        
        // title
        title.frame = CGRect(x: icon.right + 25, y: 0, width: frame.width - 100 - icon.width - 25, height: frame.height)
        title.textColor = Device.colors.darkGray
        
        // date
        date.getStringFromDate(date: Date(), withStyle: .short)
        date.font = Device.font.mainTitle(ofSize: .medium)
        date.sizeToFit()
        date.left = title.right + 25
        date.top = (height - date.height) / 2
        
        // add to view
        addSubview(icon)
        addSubview(title)
        addSubview(date)
        
    }
}
