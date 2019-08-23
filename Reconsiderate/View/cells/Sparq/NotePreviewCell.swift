
import UIKit

class NotePreviewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Device.colors.lightGray
        layer.cornerRadius = 7
        styleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
        styleView()
    }
    
    private var title = UILabel()
    private var bodyPreview = UILabel()
    private var date = UILabel()
    private var thoughtIcon = UILabel()
    
    public func addContext(_ note: Note) {
        
        title.text = note.title
        bodyPreview.text = note.detail
        date.getStringFromDate(date: Date(), withStyle: .short)
        thoughtIcon.text = note.sparq.thought.icon
        
        setView()
    }
    
    private func styleView() {
        
        // set font
        title.font = Device.font.mainTitle(ofSize: .large)
        bodyPreview.font = Device.font.body(ofSize: .medium)
        date.font = Device.font.mainTitle(ofSize: .medium)
        thoughtIcon.font = Device.font.mainTitle(ofSize: .large)
        
        title.numberOfLines = 2
        bodyPreview.numberOfLines = 6
        
    }
    
    private func setView() {
        // size to fit
        title.sizeToFit()
        bodyPreview.sizeToFit()
        date.sizeToFit()
        thoughtIcon.sizeToFit()
        
        // set in view
        title.left = 20
        title.top = 20
        title.width = 185
        
        bodyPreview.top = title.bottom + 10
        bodyPreview.left = 20
        bodyPreview.width = 185
        
        date.right = 205
        date.bottom = 215
        
        thoughtIcon.left = 20
        thoughtIcon.bottom = 215
        
        
        // add to view
        addSubview(title)
        addSubview(bodyPreview)
        addSubview(date)
        addSubview(thoughtIcon)
    }
}
