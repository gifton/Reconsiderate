
import UIKit

class ThoughtDetailHome: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .random
        
    }
    
    private var viewModel: ThoughtDetailHomeViewModel!
    
    public func set(_ vm: ThoughtDetailHomeViewModel) {
        viewModel = vm
        setContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContent() {
        print("setting content")
    }
}
