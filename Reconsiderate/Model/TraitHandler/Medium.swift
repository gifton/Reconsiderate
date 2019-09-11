
import Foundation
enum Medium: Int {
    case link = 0
    case photo = 1
    case audio = 2
    case note = 3
    
    public static func forVal(_ num: Int) -> Medium {
        switch num {
        case 0: return .link
        case 1: return .photo
        case 2: return .audio
        default: return .note
        }
    }
}
