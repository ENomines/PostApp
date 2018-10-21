import SwiftyJSON

protocol ResponseHandlerInterface {
    func handle(response: JSON)
}
