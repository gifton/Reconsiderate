import Foundation
import UIKit

public extension UICollectionView {
    // - Parameter completion: completion handler to run after reloadData finishes.
    func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    // - Returns: UICollectionViewCell object with associated class name.
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    // - Parameter name: UICollectionViewCell type.
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func registerHeaderFooter<T: UICollectionReusableView>(cellWithClass name: T.Type) {
        // UICollectionView.elementKindSectionHeader
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableHeader<T: UICollectionReusableView>(cellWithClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    // set side bar with a little bit of text on a collection view
    func setBackView(withContent payload: String) {
        let view = UIView(frame: CGRect(x: Device.width - 100, y: 0, width: 100, height: Device.height))
        //        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 5
        
        let lbl = UILabel()
        lbl.text = payload
        lbl.sizeToFit()
        view.addSubview(lbl)
        lbl.center = view.center
        
        lbl.rotate(degrees: 90)
        backgroundView = view
    }
}
