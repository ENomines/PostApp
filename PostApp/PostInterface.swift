protocol PostInterface {
    func setId(id: Int)
    func setTitle(title: String)
    func setDescription(description: String)
    func getId() -> Int
    func getTitle() -> String
    func getDescription() -> String
}
