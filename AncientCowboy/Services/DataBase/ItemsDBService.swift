import Combine
import CoreData

protocol ItemsDBService {
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error>
}

struct RealItemsDBService: ItemsDBService {
  
  let persistentStore: PersistentStore
  
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error> {
    
    return persistentStore
      .update { context in
        items.forEach { item in
          item.store(in: context)
        }
      }
  }
}
