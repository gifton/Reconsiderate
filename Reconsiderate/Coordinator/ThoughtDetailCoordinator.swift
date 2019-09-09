

import UIKit

class ThoughtDetailCoordinator: Coordinator {
    
    init(withNav navigation: UINavigationController) {
        navigationController = navigation
    }
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    public var thought: Thought?
    
    func start() {
        guard let thought = thought else { return }
        let vc = ThoughtDetailController()
        
        vc.viewModel = ThoughtDetailHomeViewModel(thought)
        
        navigationController.pushViewController(vc, animated: false)
    }
    
}
