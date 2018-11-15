import Alamofire
import SwiftyJSON

public class ResponseHandler: ResponseHandlerInterface {
    private var url: String
    
    public init(url: String) {
        self.url = url
    }
    
    internal func handle(callback: @escaping (JSON) -> Void) {
        Alamofire.request(self.url).responseJSON {
            response in
            
            switch response.result {
            case .success(let value) :
                let json = JSON(value)
                callback(json)
            case .failure(let error) :
                print("Error\(error)")
            }
        }
    }
}
