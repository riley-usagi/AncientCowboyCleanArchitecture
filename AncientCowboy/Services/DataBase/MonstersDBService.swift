import Combine
import CoreData

/// Сервис для работы с Монстрами из CoreData
protocol MonstersDBService {
  func storeAllMonstersFromWeb(monsters: [Monster]) -> AnyPublisher<Void, Error>
  func store(monstersDetails: Monster) -> AnyPublisher<Monster?, Error>
}

/// Сервис для работы с Монстрами из CoreData
struct RealMonstersDBService: MonstersDBService {
  
  /// Объект доступа к хранилищу CoreData
  let persistentStore: PersistentStore
  
  func storeAllMonstersFromWeb(monsters: [Monster]) -> AnyPublisher<Void, Error> {
    
    return persistentStore
      .update { context in
        
        monsters.forEach { monster in
          monster.store(in: context)
        }
      }
  }
  
  // MARK: - Store
  
  func store(monstersDetails: Monster) -> AnyPublisher<Monster?, Error> {
    
    return persistentStore
      .update { context in
        let details = monstersDetails.store(in: context)
        
        return details.flatMap { Monster(managedObject: $0) }
      }
  }
}
