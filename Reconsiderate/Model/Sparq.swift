
import CoreData
import CoreLocation
import UIKit

@objc(Sparq)
public class Sparq: NSManagedObject {
    
    // MARK: entity attributes
    @NSManaged public var id: String
    
    // MARK: entity optional attributes
    @NSManaged public var detail: String?
    @NSManaged public var link: String?
    @NSManaged public var title: String?
    @NSManaged public var rawRecording: Data?
    @NSManaged public var rawPhoto: Data?

    // MARK: entity relationships
    @NSManaged public var trait: Trait?
    @NSManaged public var thought: Thought
    
}

// MARK: computed properties
extension Sparq {
    public var createdAt: Date {
        return trait!.createdAt
    }
}

// MARK: static initializer
extension Sparq {
    
    static func insert(into moc: NSManagedObjectContext, with component: SparqComponent, for thought: Thought) -> Sparq {
        
        let sparq: Sparq = moc.insertObject()
        sparq.thought = thought
        
        // set id
        UserDefaults.creatededNewSparq()
        sparq.id = UserDefaults.sparqID
        
        // set components
        switch component.type {
        case .link: sparq.addLinkComponent(component as? Link)
        case .photo: sparq.addPhotoComponent(component as? Photo)
        case .note: sparq.addNoteComponent(component as? Note)
        case .audio: sparq.addAudioComponent(component as? Audio)
        }
        
        return sparq
    }
    
}

// when creating a new sparq, switch into one of these addition methods
extension Sparq {
    
    // add audio
    //    - audio
    //    - detail
    private func addAudioComponent(_ component: Audio?) {
        guard let a = component else {
            print("unable to guard into audio object")
            return
        }
        detail = a.detail
        rawRecording = a.recording
        print("added audio component")
    }
    
    // add link
    //    - url
    //    - detail
    private func addLinkComponent(_ component: Link?) {
        guard let l = component else {
            print("unable to guard into link object")
            return
        }
        link = String(describing: l.url)
        detail = l.detail
        print("added link component")
    }
    
    // add note
    //    - title
    //    - detail
    private func addNoteComponent(_ component: Note?) {
        guard let n = component else {
            print("unable to guard into note object")
            return
        }
        title = n.title
        detail = n.detail
        print("added note component")
    }
    
    // add photo
    //    - raw photo
    //    - caption
    private func addPhotoComponent(_ component: Photo?) {
        guard let p = component else {
            print("unable to guard into photo object")
            return
        }
        detail = p.caption
        rawPhoto = p.photo.pngData()
        print("added photo component")
    }
}

// MARK Managed conformance
extension Sparq: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(trait.createdAt), ascending: false)]
    }
}
