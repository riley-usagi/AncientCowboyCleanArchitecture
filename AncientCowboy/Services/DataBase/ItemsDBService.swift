import Combine
import CoreData

/// Сервис для работы с Игровыми предметами в локальной базе данных
protocol ItemsDBService {
  func storeAllItemsFromWeb(_ items: [Item]) -> AnyPublisher<Void, Error>
  
  /// Игровой предмет из локальной базы данных по его id
  /// - Parameter ingameid: Внутренний id игрового предмета
  func item(ingameid: Int) -> AnyPublisher<Item?, Error>
}

/// Сервис для работы с Игровыми предметами в локальной базе данных
struct RealItemsDBService: ItemsDBService {
  
  /// Объект точки доступа к локальной базе данных
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

