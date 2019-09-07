
import UIKit

class ThoughtDetailContainerCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        setCollection()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var router: HomeControllerDelegate?
    public var cv: UICollectionView!
    
    func setCollection() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Device.frame.size
        layout.minimumLineSpacing = 0
        
        cv = UICollectionView(frame: Device.frame, collectionViewLayout: layout)
        cv.allowsSelection = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Device.colors.primaryPink
        cv.setBackView(withContent: "Inspiration strikes without warning ⚡️")
        
        cv.dataSource = self
        
        cv.register(cellWithClass: ThoughtDetailMainCell.self)
        cv.register(cellWithClass: NewSparqCell.self)
        
        addSubview(cv)
        
        cv.scrollToItem(at: IndexPath(item: 1, section: 0), at: .right, animated: true)
    }
}

extension ThoughtDetailContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        
        if indexPath.row == 0 {
            let cCell = collectionView.dequeueReusableCell(withClass: ThoughtDetailMainCell.self, for: indexPath)
            
            cell = cCell
        } else {
            // set cell's paramaters, and gestures
            let cCell = collectionView.dequeueReusableCell(withClass: NewSparqCell.self, for: indexPath)
            
            cell = cCell
        }
        
        return cell
    }
    
    // move collection view to new thought
    private func moveToThought() {
        cv.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

