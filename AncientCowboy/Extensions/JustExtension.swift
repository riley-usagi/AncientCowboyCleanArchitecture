import Combine

extension Just where Output == Void {
  static func withErrorType<E>(_ errorType: E.Type) -> AnyPublisher<Void, E> {
    return withErrorType((), E.self)
  }
}

extension Just {
  
  static func withErrorType<E>(_ value: Output, _ errorType: E.Type) -> AnyPublisher<Output, E> {
    
    return Just(value)
      .setFailureType(to: E.self)
      .eraseToAnyPublisher()
  }
}
