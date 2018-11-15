public class PostList: PostListInterface {
    private var posts: [DTOPost]
    
    public init() {
        self.posts = []
    }

    public init(posts: [DTOPost]) {
        self.posts = posts
    }
    
    public func add(newPost: DTOPost) {
        posts.append(newPost)
    }
    
    public func sortPostsById() {
        posts.sort{ $0.id < $1.id }
    }
    
    public func getPostArray() -> [DTOPost]? {
        return posts
    }
    
    public func getPostById(id: Int) -> DTOPost? {
        for post in posts {
            if post.id == id {
                return post
            }
        }
        return nil
    }
    
}
