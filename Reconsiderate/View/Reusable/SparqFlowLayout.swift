

import UIKit

class SparqFlowLayout: UICollectionViewFlowLayout {
    
    var isDisplayingPreview: Bool = true {
        didSet {
            if isDisplayingPreview {
                print("now displaying small")
            } else {
                print("is displaying large")
            }
        }
    }
    
    var layouts = [UICollectionViewLayoutAttributes]()
}
