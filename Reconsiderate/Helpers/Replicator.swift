
import UIKit

class Replicator {
    static func newNote() -> Note {
        let note = Note()
        note.id = "giftonsrandomID"
        note.title = "This is my notes title"
        note.detail = "This is an example note detail"
        
        return note
    }
    static func newPhoto() -> Photo {
        let photo = Photo()
        photo.id = "GiftonsrandomID2"
        photo.caption = "This is an example note caption"
        if let data: Data = UIImage(named: "lightbulb")?.pngData() {
            photo.rawPhoto = data
        }
        
        return photo
    }
    
    static func newLink() -> Link {
        let link = Link()
        link.id = "GiftonsrandomID2"
        link.detail = "wesaturate is a platform that lets you upload and download free RAW and JPEG photos"
        link.link = "https://wesaturate.com"
        
        return link
    }
    
    static func randomThought() -> Thought {
        let t = Thought()
        t.id = "GiftonsStupidID243597"
        t.title = "This is a test Thought"
        t.icon = .randomEmoji()
        
        return t
    }
    
    static func randomThoughts() -> [Thought] {
        var t = [Thought]()
        for _ in 1...5 {
            t.append(randomThought())
        }
        
        return t
    }
    
    static func randomSparqs() -> [SparqComponent] {
        return [newLink(), newPhoto(), newPhoto(), newNote(), newNote(), newNote(), newPhoto(), newLink()]
    }
}
