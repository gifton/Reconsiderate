
import UIKit


protocol HomeControllerDelegate {
    func moveScrollView(to view: HomeCells)
    func createThought(forTitle title: String)
    func showThought(_ thought: Thought)
    func showNewThought()
}

enum HomeCells {
    case newThought, home, recent
}


protocol ThoughtCreator {
    func createThought(fromTitle title: String)
    func goToNewThought()
}
