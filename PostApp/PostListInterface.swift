protocol PostListInterface {
    func add(newPost: Post)
    func sortPostsById()
    func getPostById(id: Int) -> Post?
    func getPostArray() -> [Post]?
}
