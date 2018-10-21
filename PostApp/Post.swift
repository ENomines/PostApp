public class Post: PostInterface {
    private var id: Int
    private var title: String
    private var description: String
    
    public init(id: Int, title: String, description desc: String) {
        self.id = id
        self.title = title
        self.description = desc
    }
    
    public func setId(id: Int) {
        self.id = id
    }
    
    public func setTitle(title: String) {
        self.title = title
    }
    
    public func setDescription(description: String) {
        self.description = description
    }
    
    public func getId() -> Int {
        return id
    }
    
    public func getTitle() -> String {
        return title
    }
    
    public func getDescription() -> String {
        return description
    }
}
