import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    @IBOutlet var postTableView: UITableView!
    
    var posts: [DTOPost] = []
    
    let postTableViewCellId = "PostTableViewCell"
    let showFullDescriptionSegueId = "ShowFullDescription"
    let numberOfSections: Int = 1
    let tableViewCellRowHeight: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension

        postTableView.dataSource = self
        postTableView.delegate = self
        
        APIManager.getPostList(callback: {
            (postList) in
            self.posts = postList.getPostArray() ?? []
            self.postTableView.reloadData()
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTableViewCell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: postTableViewCellId, for: indexPath) as! PostTableViewCell
        
        let row = indexPath.row
        postTableViewCell.titleLabel.text = posts[row].title
        postTableViewCell.descriptionLabel.text = posts[row].description
        
        return postTableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: showFullDescriptionSegueId, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewCellRowHeight
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showFullDescriptionSegueId {
            let postViewController = segue.destination as! PostViewController
            
            if let indexPath = postTableView.indexPathForSelectedRow {
                postViewController.post = posts[indexPath.row]
            }
            
        }
    }
}
