
import Foundation
enum Medium: Int {
    case link = 0
    case photo = 1
    case audio = 2
    case note = 3
    
    public static func forVal(_ num: Int) -> Medium {
        switch num {
        case 0: return Medium.link
        case 1: return Medium.photo
        case 2: return Medium.audio
        case 3: return Medium.note
        }
    }
}
