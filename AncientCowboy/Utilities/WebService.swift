import Combine
import Foundation

/// Общая функциональность всех web-сервисов
protocol WebService {
  
  var session: URLSession { get }
  
  var baseURL: String { get }
  
  var bgQueue: DispatchQueue { get }
}


extension WebService {
  
  /// Процесс отправки запроса к удалённому серверу
  /// - Parameters:
  ///   - endpoint: Конечная точка запроса
  ///   - httpCodes: Список допустимых кодов ответа
  /// - Returns: Издатель с полученнымиданными или ошибкой
  func call<Value>(endpoint: APICall, httpCodes: HTTPCodes = .success)
  -> AnyPublisher<Value, Error> where Value: Decodable {
    
    do {
      
      let request = try endpoint.urlRequest(baseUrl: baseURL)
      
      return session
        .dataTaskPublisher(for: request)
        .requestJSON(httpCodes: httpCodes)
      
    } catch let error {
      return Fail<Value, Error>(error: error).eraseToAnyPublisher()
    }
  }
}
