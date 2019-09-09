
import UIKit

class HomeCoordinator: Coordinator {
    
    init(withNav navigation: UINavigationController) {
        navigationController = navigation
    }
    
    var childCoordinators: [Coordinator] = []
    var homeViewModel: HomeViewModel? 
    var navigationController: UINavigationController
    
    func start() {
        let vc = ViewController()
        vc.coordinator = self
        vc.viewModel = homeViewModel
        navigationController.pushViewController(ViewController(), animated: false)
    }
    
    public func goToThought(_ thought: Thought) {
        let tCoordinator = ThoughtDetailCoordinator(withNav: navigationController)
        tCoordinator.thought = thought
        childCoordinators.append(tCoordinator)
        
        tCoordinator.start()
        
    }
    
}
