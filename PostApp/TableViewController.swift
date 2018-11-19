import UIKit
import Alamofire
import SwiftyJSON
import TableKit

class TableViewController: UITableViewController {
    
    @IBOutlet var postTableView: UITableView!
    
    var posts: [DTOPost] = []
    
    let postTableViewCellId = "PostTableViewCell"
    let showFullDescriptionSegueId = "ShowFullDescription"
    let numberOfSections: Int = 1
    let tableViewCellRowHeight: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableDirector = TableDirector(tableView: postTableView)
        
        APIManager.getPostList(callback: {
            (postList) in
            let posts = postList.getPostArray() ?? []
            var rows: [TableRow<PostTableViewCell>] = []
            
            for post in posts {
                rows.append(TableRow<PostTableViewCell>(item: post.title))
            }
            
            let section = TableSection(rows: rows)
            tableDirector += section
            
            
            
            //self.postTableView.reloadData()
        })
    }
}
