
import UIKit
class ThoughtDetailController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv.register(cellWithClass: ThoughtDetailHome.self)
        tv.frame = view.frame
        view.addSubview(tv)
    }
    
    public var thought: Thought?
    
    private let tv: UITableView = {
        let tv = UITableView()
        tv.decelerationRate = UIScrollView.DecelerationRate.fast
        tv.allowsSelection = false
        tv.showsVerticalScrollIndicator = false
        tv.isPagingEnabled = true
        
        return tv
    }()
}

extension ThoughtDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.height
        }
        return 100
    }
}
extension ThoughtDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withClass: ThoughtDetailHome.self, for: indexPath)
        
        if let thought = thought {
            cell.set(ThoughtDetailHomeViewModel(thought))
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
