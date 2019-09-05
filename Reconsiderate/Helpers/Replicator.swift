
import UIKit
import CoreData
import CoreLocation

class ReplicatorService: NSObject {
    init(withContext context: NSManagedObjectContext) {
        self.context = context
    }
    
    var context: NSManagedObjectContext
    
    public func setData() {
        
    }
    
    let n1 = Note(title: "Welcome to Reconsiderate!", detail: "With Reconsiderate, you can store and recollect on your thoughts, what you see, and what you feel!", timeSince: "2 days", thoughtIcon: "💡")
    let n2 = Note(title: "Save what your thinking So that you dont forget", detail: "Our brains, remarkable as they are, could not begin to contain and give equal weight to our every moment of life.", timeSince: "2 days", thoughtIcon: "💡")
    let n3 = Note(title: "Heres our mission:", detail: "Rethought aims to help you save, organize, analyze, and ultimately learn from the things you think about. Making connections with thoughts you previously never considered having parallel attributes. Cleanly, and efficiently saving and displaying your trains of thought.", timeSince: "2 days", thoughtIcon: "💡")
    let l1 = Link(url: URL(string: "https://wesaturate.com")!, websiteDescription: "Free RAW and JPG photos", detail: "This is my website! I lovw it", thoughtIcon: "💡")
}

// MARK: private building methods for thoughts and sparqs
// thought 1: what is rethought?
    // 2 notes
        // the philosophy
        // what I hope you get out of nigma
    // 2 images
        // screenshots showing where to go for specific things
        // image of dog as examoke
    // 1 link
        // to wesaturate for example
// thought 2: Example 1
// thought 3: example 2
extension ReplicatorService {
    func createWelcomeThought() {

        let t = Thought.insert(in: context, title: "Welcome to Nigma!", icon: "💡", location: CLLocation())
        let ns1 = Sparq.insert(into: context, with: n1, for: t)
        let ns2 = Sparq.insert(into: context, with: n2, for: t)
        let ns3 = Sparq.insert(into: context, with: n3, for: t)
        let ns4 = Sparq.insert(into: context, with: l1, for: t)
        
        let tr1 = Trait.insert(into: context, with: [.admiration, .sadness, .anxiety], for: ns1)
        let tr2 = Trait.insert(into: context, with: [.satisfaction, .sadness, .sympathy], for: ns2)
        let tr3 = Trait.insert(into: context, with: [.boredom, .awkwardness, .envy], for: ns3)
        let tr4 = Trait.insert(into: context, with: [.romance, .triumph, .boredom], for: ns4)
        
        let top1 = Topic.insert(into: context, title: "New", for: tr1)
        let top2 = Topic.insert(into: context, title: "Bord", for: tr2)
        let top3 = Topic.insert(into: context, title: "Facts", for: tr3)
        let top4 = Topic.insert(into: context, title: "Inspiration", for: tr4)
        
        top1.addToTrait(tr2)
        top1.addToTrait(tr3)
        top1.addToTrait(tr4)
        
        top2.addToTrait(tr1)
        top2.addToTrait(tr3)
        top2.addToTrait(tr4)
        
        top3.addToTrait(tr1)
        top3.addToTrait(tr2)
        top3.addToTrait(tr4)
        
        top4.addToTrait(tr1)
        top4.addToTrait(tr2)
        top4.addToTrait(tr3)
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print("ther was an error saving replicator data: \(error.localizedDescription)")
        }
    }
}
