
import Foundation

protocol HorizontalScrollingTableCellDelegate: NSObject {
    func createNewThought(fromTitle title: String)
    func goToNewThought()
    func goToMe()
    func goToThoughts()
    func goToSparqs()
    func goToTraits()
    func goToSettings()
}


protocol RecentContentCellDelegate {
    func searchFor(_ payload: String)
    func goToThought(_ thought: Thought)
    func goToSparq(_ sparq: Sparq)
}
