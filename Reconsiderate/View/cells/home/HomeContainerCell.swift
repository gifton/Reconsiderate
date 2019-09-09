
import UIKit

class HomeContainerCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        setCollection()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var goToThought: (() -> ())? {
        didSet {
            print("set action in container cell")
        }
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
        cv.setBackView(withContent: "Just keep thinking 🐠")
        
        cv.dataSource = self
        
        cv.register(cellWithClass: NewThoughtCell.self)
        cv.register(cellWithClass: HomeCell.self)
        
        addSubview(cv)
        
        cv.scrollToItem(at: IndexPath(item: 1, section: 0), at: .right, animated: true)
    }
}

extension HomeContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        
        if indexPath.row == 0 {
            let cCell = collectionView.dequeueReusableCell(withClass: NewThoughtCell.self, for: indexPath)
            cCell.delegate = self
            cCell.toThoughtButton.addTapGestureRecognizer(action: goToThought)
            print("added tap gesture to thought button")
            cell = cCell
        } else {
            // set cell's paramaters, and gestures
            let cCell = collectionView.dequeueReusableCell(withClass: HomeCell.self, for: indexPath)
            cCell.toThought.addTapGestureRecognizer(action: moveToThoughtCreator)
            cCell.toRecent.addTapGestureRecognizer { self.router?.moveScrollView(to: .recent) }
            cell = cCell
        }
        
        return cell
    }
    
    // move collection view to new thought
    private func moveToThoughtCreator() {
        cv.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension HomeContainerCell: ThoughtCreator {
    func createThought(fromTitle title: String) {
        router?.createThought(forTitle: title)
    }
}


protocol ThoughtCreator {
    func createThought(fromTitle title: String)
}
