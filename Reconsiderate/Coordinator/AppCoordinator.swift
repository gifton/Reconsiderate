
import UIKit
import CoreData

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    public var context: NSManagedObjectContext? 
    
    func start() {
        
        let hCoordinator = HomeCoordinator(withNav: navigationController)
        
        if let context = context {
            hCoordinator.homeViewModel = HomeViewModel(withContext: context)
        }
        
        childCoordinators.append(hCoordinator)
        hCoordinator.start()
    }
    
    // TODO: welcome screen
    
//    func isUsersFirstTime() -> UIViewController {
//        //defaults handle thought andentry ID validation
//        //check to see if a thought has ever been made, if so, defaults will have updated to a non-zero num
//        //otherwise set defaults to 1
//        let defaults = UserDefaults.standard
//        if defaults.string(forKey: UserDefaults.Keys.authenticated) == UserDefaults.authenticated.authenticated.rawValue {
//            print("is not first time")
//            return ViewController()
//        }
//        print("is first time")
//        defaults.setValue(UserDefaults.authenticated.authenticated.rawValue, forKey: UserDefaults.Keys.authenticated)
//        return LoginController(withModel: LoginViewModel())
//    }
}
