import Combine
import CoreData

protocol ItemsDBService {
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error>
}

struct RealItemsDBService: ItemsDBService {
  
  
  let persistentStore: PersistentStore
  
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error> {
    #warning("Here")
    return Just<Void>.withErrorType(Error.self).eraseToAnyPublisher()
  }
}
