
import Foundation

class ThoughtDetailHomeViewModel {
    
    init(_ thought: Thought) {
        self.thought = thought
    }
    
    
    // MARK: Private vars
    public var thought: Thought
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.doesRelativeDateFormatting = false
        formatter.formattingContext = .listItem
        
        return formatter
    }()
    
    // MARK: public vars
    public var title: String {
        return thought.title
    }
    public var createdAt: String {
        let date = thought.date
        let d = dateFormatter.string(from: date)
        return "created \(d)"
    }
    public var isPersonal: Bool {
        return thought.isPersonal
    }
    public var icon: String {
        return thought.icon
    }
    public var totalSparqCount: String {
        return "\(thought.sparqs?.count ?? 0) total sparqs"
    }
    public var sparqsThisWeek: String {
        return "\(thought.sparqCountFromPastWeek) sparqs this week"
    }
    public var sparqs: [Sparq] {
        return thought.computedSparqs
    }
    public var location: String {
        guard let loc = thought.location else { return "" }
        return "captured in \(loc)"
    }
}
