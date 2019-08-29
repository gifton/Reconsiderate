

import UIKit

class SparqCollection: UIView {
    init(withTitle: Bool, isPreview: Bool) {
        if isPreview {
            sparqScrollDirection = .horizontal
        } else {
            sparqScrollDirection = .vertical
        }
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
        backgroundColor = .white
    }
    
    public var datasource: UICollectionViewDataSource? {
        didSet {
            cv.dataSource = datasource
            setViews()
        }
    }
    
    private var sparqScrollDirection: UICollectionView.ScrollDirection
    private var title: UILabel? = UILabel("Sparqs")
    private var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = Device.previewTile
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 50, width: Device.width, height: Device.previewTile.height), collectionViewLayout: layout)
        cv.backgroundColor = .white
        
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
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
