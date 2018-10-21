protocol PostListInterface {
    func add(post: Post)
    func removePostById(id: Int)
    func sortPostsById(id: Int)
    func getPostById(id: Int) -> Post?
    func getPostArray() -> [Post?]
}
