import Combine
import Foundation

extension Publisher where Output == URLSession.DataTaskPublisher.Output {
  
  func requestJSON<Value>(httpCodes: HTTPCodes) -> AnyPublisher<Value, Error> where Value: Decodable {
    
    return tryMap { output in
      
      assert(!Thread.isMainThread)
      
      guard let code = (output.response as? HTTPURLResponse)?.statusCode else {
        throw APIError.unexpectedResponse
      }
      
      guard httpCodes.contains(code) else {
        throw APIError.httpCode(code)
      }
      
      return output.data
    }
    .decode(type: Value.self, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }
}
