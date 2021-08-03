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


extension Publisher {
  
  func extractUnderlyingError() -> Publishers.MapError<Self, Failure> {
    mapError {
      ($0.underlyingError as? Failure) ?? $0
    }
  }
  
  func ensureTimeSpan(_ interval: TimeInterval) -> AnyPublisher<Output, Failure> {
    
    let timer = Just<Void>(())
      .delay(for: .seconds(interval), scheduler: RunLoop.main)
      .setFailureType(to: Failure.self)
    
    return zip(timer)
      .map { $0.0 }
      .eraseToAnyPublisher()
  }
  
  
  #warning("SinkToLoadable")
  
  func sinkToResult(_ result: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
    
    return sink(receiveCompletion: { completion in
      
      switch completion {
      
      case let .failure(error):
        result(.failure(error))
      default: break
      }
    }, receiveValue: { value in
      result(.success(value))
    })
  }
}
