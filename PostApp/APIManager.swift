public class APIManager {
    public static func getPostList(callback: @escaping (PostList) -> Void) {
        let responseHandler = ResponseHandler(url: "https://jsonplaceholder.typicode.com/posts")
        
        responseHandler.handle(callback: {
            (json) in
            let postList = PostList()
            
            for (_, postData) in json {
                let id = postData["id"].int ?? 0
                let title = postData["title"].string ?? ""
                let body = postData["body"].string ?? ""
                
                let post = DTOPost(id: id, title: title, description: body)
                postList.add(newPost: post)
            }
            callback(postList)
        })
    }
    
    public static func getUsers() {
        
    }
    
    public static func getPhotos() {
        
    }
    
    public static func getComments() {
        
    }
}
