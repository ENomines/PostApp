protocol PostListInterface {
    func add(newPost: DTOPost)
    func sortPostsById()
    func getPostById(id: Int) -> DTOPost?
    func getPostArray() -> [DTOPost]?
}
