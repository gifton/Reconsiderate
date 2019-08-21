
import UIKit

// recent cell holds users recent thoughts and sparqs
class RecentCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setThoughts(); setHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private vars
    private var thoughtTitle = UILabel("Thoughts")
    
    // MARK: public vars
    public var toHome = UIButton()
    
    private func setThoughts() {
        var yPos = CGFloat(250)
        for _ in 0...4 {
            let view = MicroThoughtView()
            view.frame.origin = CGPoint(x: 50, y: yPos)
            
            addSubview(view)
            
            yPos += Device.padding.medium.rawValue + view.height
        }
    }
    
    private func setHeader() {
        
        // thought header
        thoughtTitle.font = Device.font.mainTitle(ofSize: .xXLarge)
        thoughtTitle.sizeToFit()
        thoughtTitle.left = 50
        thoughtTitle.bottom = 240
        
        // to home
        toHome.setImage(#imageLiteral(resourceName: "arrow-up"), for: .normal)
        toHome.setTitle("Home", for: .normal)
        toHome.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        toHome.setTitleColor(Device.colors.secondaryGray, for: .normal)
        toHome.sizeToFit()
        toHome.width += 7
        toHome.top = 55
        toHome.centerX = Device.width / 2
        
        addSubview(thoughtTitle)
        addSubview(toHome)
    }
}
