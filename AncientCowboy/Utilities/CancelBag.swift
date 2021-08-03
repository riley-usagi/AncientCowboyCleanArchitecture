import Combine

final class CancelBag {
  
  var subscriptions = Set<AnyCancellable>()
  
  func cancel() {
    subscriptions.removeAll()
  }
}
