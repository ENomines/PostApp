import SwiftyJSON

public class PostResponseHandler: ResponseHandlerInterface {
    public var postList: PostList = PostList()
    
    public init(_ response: JSON) {
        handle(response: response)
    }
    
    internal func handle(response: JSON) {
        for (_, postData) in response {
            let post = Post(id: postData["id"].int!, title: postData["title"].string!, description: postData["body"].string!)
            
            postList.add(newPost: post)
        }
    }

    public func getPostList() -> PostList? {
        return postList
    }
}
