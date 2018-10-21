import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    public var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = post?.getTitle()
        descriptionTextView.text = post?.getDescription()
    }
    
}
