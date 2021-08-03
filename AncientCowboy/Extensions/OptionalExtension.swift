import Foundation

protocol SomeOptional {
  associatedtype Wrapped
  
  func unwrap() throws -> Wrapped
}

extension Optional: SomeOptional {
  func unwrap() throws -> Wrapped {
    
    switch self {
    
    case .none:
      throw ValueIsMissing()
    case let .some(value):
      return value
    }
  }
}

struct ValueIsMissing: Error {
  
  var localizedMissingDescription: String {
    NSLocalizedString("Data is missing", comment: "")
  }
}
