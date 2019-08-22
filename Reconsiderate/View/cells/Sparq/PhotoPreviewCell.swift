
import Foundation
import UIKit

class PhotoPreviewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    public func addContext(_ photo: Photo) {
        
        self.photo.image = UIImage(data: photo.rawPhoto)
        dateLabel.getStringFromDate(date: Date(), withStyle: .short)
        thoughtIcon.text = photo.sparq.thought.icon
        
    }
    
    private var photo = UIImageView()
    private var dateLabel = UILabel()
    private var thoughtIcon = UILabel()
    private var iconFrame = UIView()
    
    private func addContext() {
        
        addSubview(photo)
        addSubview(dateLabel)
        addSubview(iconFrame)
        iconFrame.addSubview(thoughtIcon)
        
        photo.contentMode = .scaleAspectFill
        // shouldnt need this TEST TEST TEST
//        photo.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        
        photo.frame = CGRect(origin: .zero, size: Device.previewTile)
        
        iconFrame.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        iconFrame.layer.cornerRadius = 8
        iconFrame.frame.size = CGSize(width: 40, height: 40)
        iconFrame.bottom = 200
        iconFrame.left = 20

        thoughtIcon.font = Device.font.body(ofSize: .large)
        thoughtIcon.textAlignment = .center
        thoughtIcon.frame = iconFrame.frame
        
        dateLabel.font = Device.font.mainTitle(ofSize: .large)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        dateLabel.sizeToFit()
        dateLabel.top = 16
        dateLabel.right = 218
        
        
    }
}

