
import UIKit

class NewThoughtCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        buildUI()
        style()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK delegate
    public var delegate: ThoughtCreator?
    public let toThoughtButton = UIButton()
    // MARK: ui components
    private let thoughtCard = UIView()
    private let logo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    private let cancelButton = UIButton()
    private let questionLabel = UILabel("whats on your mind?")
    private let thoughtTextView = UITextView()
    private let thoughtImage = UIImageView(image: #imageLiteral(resourceName: "cloud"))
    private let saveButton = UIButton()
    private let savedImage = UIImageView(image: #imageLiteral(resourceName: "checkMark"))
    
}

// MARK: all UIBuilding functions

extension NewThoughtCell {
    private func buildUI() {
        
        // set thought card
        thoughtCard.frame = CGRect(x: 25, y: 100, width: Device.width - 50, height: 250)
        thoughtCard.backgroundColor = .white
        thoughtCard.layer.cornerRadius = 25
        thoughtCard.layer.masksToBounds = true
        
        saveButton.frame = CGRect(x: 25, y: thoughtCard.bottom + 25, width: thoughtCard.width, height: 55)
        saveButton.addTapGestureRecognizer(action: didPressSave)
        
        addSubview(thoughtCard)
        addSubview(saveButton)
        
        buildThoughtCard()
    }
    
    private func buildThoughtCard() {
        //frames
        logo.frame = CGRect(x: 40, y: 40, width: 60, height: 60)
        cancelButton.frame = CGRect(x: thoughtCard.right - 130, y: 40, width: 90, height: 25)
        thoughtImage.frame = CGRect(x: 40, y: 123.25, width: 20, height: 14)
        questionLabel.frame = CGRect(x: thoughtImage.right + 5, y: 120, width: 200, height: 20)
        thoughtTextView.frame = CGRect(x: 40, y: thoughtCard.height - 55, width: thoughtCard.width - 80, height: 25)
        
        // add thoughtcard views
        thoughtCard.addSubview(logo)
        thoughtCard.addSubview(cancelButton)
        thoughtCard.addSubview(thoughtImage)
        thoughtCard.addSubview(questionLabel)
        thoughtCard.addSubview(thoughtTextView)
    }
    private func style() {
        toThoughtButton.setTitleColor(Device.colors.primaryBlue, for: .normal)
        toThoughtButton.setTitle("Go to Thought", for: .normal)
        toThoughtButton.addTapGestureRecognizer(action: goToThought)
        
        saveButton.backgroundColor = Device.colors.primaryBlue
        saveButton.setTitle("Save Thought", for: .normal)
        saveButton.layer.cornerRadius = 15
        saveButton.layer.masksToBounds = true
        saveButton.alpha = 0.5
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(Device.colors.secondaryGray, for: .normal)
        
        questionLabel.text = "Whats on your mind?"
        
        thoughtTextView.text = "Start typing..."
        thoughtTextView.font = Device.font.mediumTitle(ofSize: .medium)
        thoughtTextView.textColor = .darkGray
        thoughtTextView.delegate = self
        
    }
    
    private func didStartThought() {
        saveButton.alpha = 1.0
    }
    private func clear() {
        // reset outside view alphas
        saveButton.alpha = 0.5
        toThoughtButton.alpha = 0
        
        // reset thought card views
    }
    
    private func didPressSave() {
        // remove tv focus
        
        if thoughtTextView.text.count > 1 {
            delegate?.createThought(fromTitle: thoughtTextView.text)
            saved()
        }
    }
    
    // TODO: run fetch request to see if there are any thoughts already similar
    private func saved() {
        // set new views
        toThoughtButton.alpha = 1.0
        toThoughtButton.frame = CGRect(x:thoughtCard.width - 150, y: thoughtCard.height - 45, width: 120, height: 25)
        savedImage.frame.size = CGSize(width: 40, height: 40)
        savedImage.frame.origin = CGPoint(x: (thoughtCard.width - 80) / 2, y: 50)
        saveButton.alpha = 0.5
        
        // animate card content out
        UIView.animate(withDuration: 0.25, animations: {
            self.thoughtCard.subviews.forEach { $0.alpha = 0.0 }
        })
        
        // add subviews
        thoughtCard.addSubview(toThoughtButton)
        thoughtCard.addSubview(savedImage)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 35, options: .curveEaseOut, animations: {
            self.savedImage.frame.size = CGSize(width: 80, height: 80)
        }, completion: nil)        
    }
    
    private func goToThought() {
        print("tapped go to thought")
    }
}

// MARK: NewthoughtCell TextView Delegate conformance
extension NewThoughtCell: UITextViewDelegate {
    
    // remove "place holder" text on focus
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    // once user has started editing, make save button available only if tv has at least 2 chars in it
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 1 {
            didStartThought()
        } else {
            saveButton.alpha = 0.5
        }
    }
}
