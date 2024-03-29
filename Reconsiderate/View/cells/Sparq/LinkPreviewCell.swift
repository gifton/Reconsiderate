
import Foundation
import UIKit

class LinkPreviewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView(); styleView()
        setEmpty()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private objects
    // content views
    private let thoughtIconLabel = UILabel()
    private let dateLabel        = UILabel()
    private let linkIcon         = UIImageView()
    private let titleLabel       = UILabel()
    private let detailLabel      = UILabel()
    //stylistic views
    private let linkIconBackDrop = UIView()
    private let bottomView       = UIView()
    
    
    private func setView() {
        // set superView
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 4
        
        // set frames
        bottomView.frame = CGRect(x: 0, y: frame.height - 50, width: frame.width, height: 50)
        thoughtIconLabel.frame = CGRect(x: 10, y: 7.5, width: 35, height: 35)
        dateLabel.frame = CGRect(x: frame.width - 80, y: 15, width: 70, height: 16)
        linkIconBackDrop.frame = CGRect(x: (frame.width - 70) / 2, y: 10, width: 70, height: 70)
        linkIcon.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        titleLabel.frame = CGRect(x: 10, y: 85, width: frame.width - 20, height: 16)
        detailLabel.frame = CGRect(x: 10, y: 101, width: frame.width - 20, height: 35)
        
        // add to subview
        addSubview(bottomView)
        addSubview(linkIconBackDrop)
        addSubview(titleLabel)
        addSubview(detailLabel)
        // subview subviews
        linkIconBackDrop.addSubview(linkIcon)
        bottomView.addSubview(thoughtIconLabel)
        bottomView.addSubview(dateLabel)
    }
    
    private func styleView() {
        // font
        thoughtIconLabel.font = Device.font.mainTitle(ofSize: .emojiSM)
        dateLabel.font = Device.font.mainTitle(ofSize: .large)
        titleLabel.font = Device.font.body(ofSize: .large)
        detailLabel.font = Device.font.mainTitle(ofSize: .small)
        // color
        bottomView.backgroundColor = Device.colors.offWhite
        dateLabel.textColor = UIColor(hex: "929292")
        linkIconBackDrop.backgroundColor = Device.colors.offWhite
        titleLabel.textColor = UIColor(hex: "8A9699")
        // misc
        thoughtIconLabel.textAlignment = .center
        linkIconBackDrop.layer.cornerRadius = 35
        linkIcon.image = #imageLiteral(resourceName: "check-circle")
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 2
    }
    
    private func setEmpty() {
        thoughtIconLabel.text = String.randomEmoji()
        dateLabel.text = "03-24-2095"
        detailLabel.text = "download free raw and jpg photos"
        titleLabel.text = "wesaturate.com"
    }
}

//extension HomeLinkTile: BuilderContext {
//    func addContext(_ builder: EntryBuilder) {
//        guard let linkBuilder: LinkBuilder = builder as? LinkBuilder else {
//            setEmptyView()
//            return
//        }
//
//        thoughtIconLabel.text = linkBuilder.thoughtIcon.icon
//        dateLabel.getStringFromDate(date: linkBuilder.date, withStyle: .short)
//        titleLabel.text = linkBuilder.title
//        detailLabel.text = linkBuilder.detail
//
//        guard let rawIconUrl = linkBuilder.rawIconUrl else { return }
//        guard let iconURL = URL(string: rawIconUrl) else { return }
//        linkIcon.download(from: iconURL)
//    }
//
//    private func setEmptyView() {
//
//    }
//}
