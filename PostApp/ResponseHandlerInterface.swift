import SwiftyJSON

protocol ResponseHandlerInterface {
   func handle(callback: @escaping (JSON) -> Void)
}
