
import UIKit

class HomeCoordinator: Coordinator {
    
    init(withNav navigation: UINavigationController) {
        navigationController = navigation
    }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        
    }
    
    
    
}
