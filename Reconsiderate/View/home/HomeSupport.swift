
import UIKit


protocol HomeControllerDelegate {
    func moveScrollView(to view: HomeCells)
    func createThought(forTitle title: String)
    func showThought(_ thought: Thought)
}

enum HomeCells {
    case newThought, home, recent
}
