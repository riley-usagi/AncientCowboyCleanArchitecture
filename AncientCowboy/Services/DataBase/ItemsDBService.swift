import Combine
import CoreData

protocol ItemsDBService {
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error>
  
  func item(ingameid: Int) -> AnyPublisher<Item?, Error>
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
  
  func item(ingameid: Int) -> AnyPublisher<Item?, Error> {
    
    let fetchRequest = ItemModelObject.item(by: ingameid)
    
    return persistentStore
      .fetch(fetchRequest) { fetchedMonster in
        Item(managedObject: fetchedMonster)
      }
      .map { $0.first }
      .eraseToAnyPublisher()
  }
}

