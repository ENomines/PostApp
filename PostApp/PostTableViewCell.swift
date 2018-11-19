import UIKit
import TableKit

class PostTableViewCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with item: String) {
        titleLabel.text = item
    }
}
