import Combine
import Foundation

protocol ItemsWebService: WebService {
  func loadItemsFromWeb() -> AnyPublisher<[Item], Error>
}

struct RealItemsWebService: ItemsWebService {

  var session: URLSession
  var baseURL: String
  var bgQueue: DispatchQueue = DispatchQueue(label: "bg_prase_queue")
  
  init(session: URLSession, baseURL: String) {
    self.session = session
    self.baseURL = baseURL
  }
  
  func loadItemsFromWeb() -> AnyPublisher<[Item], Error> {
    let request: AnyPublisher<[Item], Error> = call(endpoint: ItemsAPI.items)
    
    return request
      .eraseToAnyPublisher()
  }
}


extension RealItemsWebService {
  enum ItemsAPI {
    case items
  }
}


extension RealItemsWebService.ItemsAPI: APICall {
  var path: String {
    switch self {
    
    case .items:
      return "/items/"
    }
  }
  
  var method: String {
    switch self {
    
    case .items:
      return "GET"
    }
  }
  
  var headers: [String : String]? {
    return ["Accept": "application/json"]
  }
  
  func body() throws -> Data? {
    return nil
  }
}
