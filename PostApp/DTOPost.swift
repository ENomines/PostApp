public class DTOPost {
    public var id: Int
    public var title: String
    public var description: String
    
    public init(id: Int, title: String, description desc: String) {
        self.id = id
        self.title = title
        self.description = desc
    }
}
