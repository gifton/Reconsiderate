
import UIKit

class HomeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setHead()
        setButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var logo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    var welcomeLabel = UILabel(String.greeting() + ",")
    var welcomeUser = UILabel("Gifton")
    
    private func setButtons() {
        var yPosition: CGFloat = welcomeUser.bottom + 100
        for type in HomeTabType.exhastive {
            let bar = HomeTab(type)
            bar.frame.origin = CGPoint(x: 35, y: yPosition)
            yPosition += Device.padding.medium.rawValue + bar.height
            
            addSubview(bar)
        }
    }
    
    private func setHead() {
        logo.frame = CGRect(x: 45, y: 70, width: 60, height: 60)
        logo.contentMode = .scaleToFill
        
        welcomeLabel.sizeToFit()
        welcomeLabel.top = logo.bottom + 10
        welcomeLabel.left = logo.left
        
        welcomeUser.font = Device.font.mediumTitle(ofSize: .max)
        welcomeUser.sizeToFit()
        welcomeUser.top = welcomeLabel.bottom
        welcomeUser.left = welcomeLabel.left
        
        addSubview(logo)
        addSubview(welcomeLabel)
        addSubview(welcomeUser)
        
    }
}
