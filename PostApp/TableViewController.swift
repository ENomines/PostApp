import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    @IBOutlet var postTableView: UITableView!
    
    var posts: [Post] = []
    
    let postTableViewCellId = "PostTableViewCell"
    let showFullDescriptionSegueId = "ShowFullDescription"
    let numberOfSections: Int = 1
    let tableViewCellRowHeight: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postTableView.dataSource = self
        postTableView.delegate = self
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON {
            response in
            
            switch response.result {
            case .success(let value) :
                let json = JSON(value)
                
                let handler = PostResponseHandler(json)
                let postList = handler.getPostList()
                
                postList?.add(newPost: Post(id: 0, title: "Title", description: "Some text..."))
                postList?.getPostById(id: 1)?.setTitle(title: "New title")
                postList?.getPostById(id: 2)?.setDescription(description: "New description"
                )
                postList?.sortPostsById()
                
                self.posts = postList?.getPostArray() ?? []
                
                self.postTableView.reloadData()
            case .failure(let error) :
                print("Error\(error)")
            }
        }
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
        postTableViewCell.titleLabel.text = posts[row].getTitle()
        postTableViewCell.descriptionLabel.text = posts[row].getDescription()
        
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
