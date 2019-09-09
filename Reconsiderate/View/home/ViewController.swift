
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv.delegate = self
        tv.dataSource = self
        tv.frame = view.frame
        tv.rowHeight = view.frame.height
        
        tv.register(cellWithClass: HomeContainerCell.self)
        tv.register(cellWithClass: RecentCell.self)
        
        view.addSubview(tv)
        view.backgroundColor = .white
    }
    
    // MARK: public vars
    public var coordinator: HomeCoordinator?
    public var viewModel: HomeViewModel!  {
        didSet { print("vm set")}
    }
    
    // MARK: public vars
    let tv: UITableView = {
        let tv = UITableView()
        tv.decelerationRate = UIScrollView.DecelerationRate.fast
        tv.allowsSelection = false
        tv.showsVerticalScrollIndicator = false
        tv.isPagingEnabled = true
        
        return tv
    }()
    
    let generator = UINotificationFeedbackGenerator()
    
    private func goToThought() {
        print("attempting to go to thought in ViewController")
        
        if let vm = viewModel {
            print("vm confirmed")
        } else { print("vm not there")}
        if let t = viewModel?.thoughts.first {
            print("going to vc")
            coordinator?.goToThought(t)
        } else {
            print("unable to find thought to go to vc")
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // if its row 0, return home container cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withClass: HomeContainerCell.self, for: indexPath)
            cell.cv.delegate = self
            cell.router = self
            cell.goToThought = goToThought
            print( "set go to thought method in viewController" )
            return cell
        }
        
        // return recent celll otherwise
        let cell = tableView.dequeueReusableCell(withClass: RecentCell.self, for: indexPath)
        cell.toHome.addTapGestureRecognizer(action: scrollToHome)
        cell.viewModel = RecentCellViewModel()
        cell.cvDatasource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        generator.notificationOccurred(.warning)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    // table view should only scroll on home view
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            tv.isScrollEnabled = false
        } else {
            tv.isScrollEnabled = true
        }
    }
}

extension ViewController: HomeControllerDelegate {
    func moveScrollView(to view: HomeCells) {
        if view == .recent {
            tv.scrollToRow(at: IndexPath(item: 1, section: 0), at: .middle, animated: true)
        }
    }
    
    func scrollToHome() {
        tv.scrollToRow(at: IndexPath(item: 0, section: 0), at: .middle, animated: true)
    }
    
    func createThought(forTitle title: String) {
        // make thought
        print("making a thought with title: \(title)")
    }
    func showThought(_ thought: Thought) {
        coordinator?.goToThought(thought)
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: NotePreviewCell.self, for: indexPath)
        
        return cell
    }
}
