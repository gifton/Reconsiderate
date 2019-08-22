
import UIKit

class NotePreviewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
    }
    
    private func styleView() {
        
        // set font
        title.font = Device.font.mainTitle(ofSize: .large)
        bodyPreview.font = Device.font.body(ofSize: .medium)
        date.font = Device.font.body(ofSize: .medium)
        thoughtIcon.font = Device.font.mainTitle(ofSize: .large)
        
    }
}
