import Foundation

extension NSSet {
  func toArray<T>(of type: T.Type) -> [T] {
    allObjects.compactMap { $0 as? T }
  }
}
