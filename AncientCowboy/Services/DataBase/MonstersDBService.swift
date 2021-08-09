import Combine
import CoreData

/// Сервис для работы с Монстрами из CoreData
protocol MonstersDBService {
  func storeAllMonstersFromWeb(monsters: [Monster]) -> AnyPublisher<Void, Error>
  func store(monstersDetails: Monster) -> AnyPublisher<Monster?, Error>
  func monster(ingameid: Int) -> AnyPublisher<Monster?, Error>
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
  
  func monster(ingameid: Int) -> AnyPublisher<Monster?, Error> {
    let fetchRequest = MonsterModelObject.monster(by: 1002)
    
    return persistentStore
      .fetch(fetchRequest) { fetchedMonster in
        Monster(managedObject: fetchedMonster)
      }
      .map { $0.first }
      .eraseToAnyPublisher()
  }
  
  func store(monstersDetails: Monster) -> AnyPublisher<Monster?, Error> {
    
    return persistentStore
      .update { context in
        let details = monstersDetails.store(in: context)
        
        return details.flatMap { Monster(managedObject: $0) }
      }
  }
}
