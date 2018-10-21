/*
    Тут возник вопрос. Исходя из принципа инверсии зависисмостей класс поста нужно убрать и использовать интерфейс.
    Или это касается только классов из другой функциональности? То есть PostList здесь выступает в роли контейнера именно для поста. Функции тоже должны возвращать интерфейс? Свойства класса тоже должны быть интерфейсом?
 */

public class PostList: PostListInterface {
    private var posts: [Post]
    
    public init() {
        self.posts = []
    }

    public init(posts: [Post]) {
        self.posts = posts
    }
    
    public func add(newPost: Post) {
        posts.append(newPost)
    }
    
    public func sortPostsById() {
        posts.sort{ $0.getId() < $1.getId() }
    }
    
    public func getPostArray() -> [Post]? {
        return posts
    }
    
    public func getPostById(id: Int) -> Post? {
        for post in posts {
            if post.getId() == id {
                return post
            }
        }
        return nil
    }
    
}
