import Combine
import SwiftUI

typealias LoadableSubject<Value> = Binding<Loadable<Value>>

enum Loadable<T> {
  
  case notRequested
  
  case isLoading(last: T?, cancelBag: CancelBag)
  
  case loaded(T)
  
  case failed(Error)
  
  
  var value: T? {
    switch self {
    case let .isLoading(last, _): return last
    default: return nil
    }
  }
}

extension Loadable {
  
  mutating func setIsLoading(cancelBag: CancelBag) {
    self = .isLoading(last: value, cancelBag: cancelBag)
  }
  
  func map<V>(_ transform: (T) throws -> V) -> Loadable<V> {
    do {
      
      switch self {
      
      case .notRequested: return .notRequested
      case let .isLoading(value, cancelBag):
        return .isLoading(last: try value.map { try transform($0) }, cancelBag: cancelBag)
      case let .loaded(value):
        return .loaded(try transform(value))
      case let .failed(error):
        return .failed(error)
      }
      
    } catch {
      return .failed(error)
    }
  }
}

extension Loadable where T: SomeOptional {
  
  func unwrap() -> Loadable<T.Wrapped> {
    map { try $0.unwrap() }
  }
}
