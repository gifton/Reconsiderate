
import UIKit

// home cell holds all major navigation components for application
class HomeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setHead(); setButtons(); addNavButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private vars
    private var logo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    private var welcomeLabel = UILabel(String.greeting() + ",")
    private var welcomeUser = UILabel("Gifton")
    public var toThought = UIButton()
    public var toRecent = UIButton()
    
    // add main navigation buttons
    private func setButtons() {
        var yPosition: CGFloat = welcomeUser.bottom + 100
        for type in HomeTabType.exhastive {
            let bar = HomeTab(type)
            bar.frame.origin = CGPoint(x: 35, y: yPosition)
            yPosition += Device.padding.large.rawValue + bar.height
            
            addSubview(bar)
        }
    }
    
    // header with greeting setter
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
    
    // buttons at bottom direct user to recent view (cell 1) and new thought (cell 0 - 0)
    func addNavButtons() {
        // set titles and images
        // recent
        toRecent.setImage(#imageLiteral(resourceName: "arrow-down"), for: .normal)
        toRecent.setTitle("Recent", for: .normal)
        // thought
        toThought.setImage(#imageLiteral(resourceName: "arrow-left"), for: .normal)
        toThought.setTitle("New Thought", for: .normal)
        
        // style buttons
        // recent
        toRecent.setTitleColor(Device.colors.secondaryGray, for: .normal)
        toRecent.sizeToFit()
        toRecent.imageView?.contentMode = .scaleAspectFill
        toRecent.imageEdgeInsets = UIEdgeInsets(top: 0, left: toRecent.width - 5, bottom: 0, right: -5)
        toRecent.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        toRecent.width += 7
        toRecent.centerX = Device.width / 2
        toRecent.frame.origin.y = Device.height - Device.height * 0.19
        // thought
        toThought.setTitleColor(Device.colors.secondaryGray, for: .normal)
        toThought.sizeToFit()
        toThought.width += 7
        toThought.centerX = Device.width / 2
        toThought.frame.origin.y = Device.height - Device.height * 0.22
        toThought.titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        
        // add to view
        addSubview(toRecent)
        addSubview(toThought)
        
    }
}
