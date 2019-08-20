
import UIKit

class RecentCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setThoughts(); setHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var logo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    
    private func setThoughts() {
        var yPos = CGFloat(250)
        for _ in 0...4 {
            print("adding view")
            let view = MicroThoughtView()
            view.frame.origin = CGPoint(x: 50, y: yPos)
            
            addSubview(view)
            
            yPos += Device.padding.medium.rawValue + view.height
        }
    }
    
    private func setHeader() {
        logo.frame = CGRect(x: 45, y: 70, width: 60, height: 60)
        logo.contentMode = .scaleToFill
        
        addSubview(logo)
    }
}
