import Combine

extension AnyCancellable {
  func store(in cancelBag: CancelBag) {
    cancelBag.subscriptions.insert(self)
  }
}
