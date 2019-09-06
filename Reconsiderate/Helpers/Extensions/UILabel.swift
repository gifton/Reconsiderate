
import UIKit

extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    //add padding to  label
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    // set text to date
    func getStringFromDate(date: Date, withStyle style: DateFormatter.Style) {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = style
            formatter.timeStyle = .none
            formatter.doesRelativeDateFormatting = false
            formatter.formattingContext = .listItem

            return formatter
        }()
        let output = dateFormatter.string(from: date)
        self.text = output
    }
    
    convenience init(_ payload: String) {
        self.init()
        text = payload
    }
    
    /**
     Highlight ibdividual chars in a label.
     
     - parameter value: The full text.
     - parameter highlight: The text to be highlighted.
     usage: call function during search and set search payload to parameter highlight: String?
     */
    func setText(value: String?, highlight: String?) {
        
        guard let value = value, let highlight = highlight else { return }
        
        let attributedText = NSMutableAttributedString(string: value)
        let range = (value as NSString).range(of: highlight, options: .caseInsensitive)
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .backgroundColor: UIColor.yellow,
            .foregroundColor: UIColor.black
        ]
        
        attributedText.addAttributes(strokeTextAttributes, range: range)
        self.attributedText = attributedText
        
    }
}
