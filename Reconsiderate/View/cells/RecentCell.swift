
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
        thoughtTitle.font = Device.font.mainTitle()
        thoughtTitle.sizeToFit()
        thoughtTitle.left = 50
        thoughtTitle.bottom = 225
        
        addSubview(thoughtTitle)
    }
}
