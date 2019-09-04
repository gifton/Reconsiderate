
import Foundation
import NaturalLanguage
import CoreData

// topic identifier takes advantage og Swift's Natural language framework to find common places, anames, and other keywords to be used as topics for a sparq

class TopicIdentifier {
    
    init(withMoc moc: NSManagedObjectContext) {
        self.moc = moc
    }
    public var content: String = "" {
        didSet {
            tagger.string = content
        }
    }
    
    // MARK: private var
    private var moc: NSManagedObjectContext
    private let tagger = NLTagger(tagSchemes: [.nameType])
    private var topics = [Topic]()
    
    public func findNamesPeoplePlaces() -> [Topic] {
        let tags = tagger.tags(in: content.startIndex..<content.endIndex, unit: .word, scheme: .lexicalClass,
                               options: [.joinNames,
                                         .omitPunctuation,
                                         .omitOther,
                                         .joinNames]
        )
        
        
        for (tag, range) in tags {
            let title = String(content[range])
            let topic = Topic.insert(into: moc, title: title, date: Date())
            topics.append(topic)
            print("tag: \(String(describing: tag))")
            print("content: \(title)")
            print("------------------")
        }
        
        return topics
    }
    
    
}
