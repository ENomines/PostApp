import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    public var post: DTOPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = post?.title
        descriptionTextView.text = post?.description
    }
    
}
