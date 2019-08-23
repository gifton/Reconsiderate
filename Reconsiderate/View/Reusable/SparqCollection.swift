

import UIKit

class SparqCollection: UIView {
    init(withTitle: Bool, isPreview: Bool) {
        
        var height: CGFloat = 0
        
        if isPreview {
            height = 288
        } else {
            height = 500
        }
        
        if withTitle {
            height += 55
        }
        
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: Device.width, height: height)))
        backgroundColor = .blue
    }
    
    public var datasource: UICollectionViewDataSource? {
        didSet {
            cv.dataSource = datasource
            setViews()
        }
    }
    
    private var title: UILabel? = UILabel("Sparqs")
    private var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = Device.previewTile
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: Device.width, height: Device.previewTile.height), collectionViewLayout: layout)
        
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        cv.bottom = bottom - 55
        cv.delegate = self
        cv.register(cellWithClass: NotePreviewCell.self)
        
        addSubview(cv)
        
        guard let title = title else { return }
        title.frame = CGRect(x: 50, y: 0, width: 150, height: 25)
        title.font = Device.font.mediumTitle()
        addSubview(title)
    }
}

extension SparqCollection: UICollectionViewDelegate { }
