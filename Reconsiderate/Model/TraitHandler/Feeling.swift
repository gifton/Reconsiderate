
enum Feeling: String, CaseIterable {
    case admiration = "admiration"
    case adoration = "adoration"
    case aestheticAppreciation = "aesthetic appreciation"
    case amusement = "amusement"
    case anxiety = "anxiety"
    case awe = "awe"
    case awkwardness = "awkwardness"
    case boredom = "boredom"
    case calmness = "calmness"
    case confusion = "confusion"
    case craving = "craving"
    case disgust = "disgust"
    case empatheticPain = "empathetic pain"
    case entrancement = "entrancement"
    case envy = "envy"
    case excitement = "excitement"
    case fear = "fear"
    case horror = "horror"
    case interest = "interest"
    case joy = "joy"
    case nostalgia = "nostalgia"
    case romance = "romance"
    case sadness = "sadness"
    case satisfaction = "satisfaction"
    case sympathy = "sympathy"
    case triumph = "triumph"
    
    static func find(_ predicate: String) -> Feeling? {
        var out: Feeling? = nil
        Feeling.allCases.forEach {
            if $0.rawValue == predicate { out = $0 }
        }
        return out
    }
}
