import Combine
import SwiftUI

/// Интерактор для работы с Монстрами
protocol MonstersInteractor {
  func storeAllMonstersFromWeb()
  func reloadEnemy(_ enemy: LoadableSubject<Monster>)
  func updateEnemy(monster: Monster, enemy: LoadableSubject<Monster>)
}


struct RealMonstersInteractor: MonstersInteractor {
  let cancelBag = CancelBag()
  
  /// Технический параметр определяющий задержку в запросе к серверам
  private var requestHoldBackTimeInterval: TimeInterval {
    return ProcessInfo.processInfo.isRunningTests ? 0 : 0.5
  }
  
  let appState: Store<AppState>
  
  /// Сервис для работы с Монстрами из CoreData
  let dbService: MonstersDBService
  
  let webService: MonstersWebService
  
  func reloadEnemy(_ enemy: LoadableSubject<Monster>) {
    
    enemy.wrappedValue.setIsLoading(cancelBag: cancelBag)
    
    dbService
      .monster(ingameid: [1002, 1097, 1079, 1183, 1901].randomElement()!)
    
      .sinkToLoadable { optionalLoadableMonster in
        enemy.wrappedValue = optionalLoadableMonster.unwrap()
      }
      .store(in: cancelBag)
  }
  
  func storeAllMonstersFromWeb() {
    
    webService
      .loadMonstersFromWeb()
      .ensureTimeSpan(requestHoldBackTimeInterval)
      .subscribe(on: DispatchQueue.global(qos: .default))
      .sink { _ in } receiveValue: { receivedMonstersList in
        
        for monster in receivedMonstersList {
          _ = dbService.store(monstersDetails: monster)
        }
      }
      .store(in: cancelBag)
  }
  
  func updateEnemy(monster: Monster, enemy: LoadableSubject<Monster>) {
    enemy.wrappedValue.setIsLoading(cancelBag: cancelBag)
    
    var temporaryMonster = monster
    
    if temporaryMonster.hp >= 11 {
      temporaryMonster.hp -= 11
    } else {
      temporaryMonster.hp = 0
    }
    
    Just<Monster>.withErrorType(temporaryMonster, Error.self)
      .sinkToLoadable { updatedMonster in
        enemy.wrappedValue = updatedMonster
      }
      .store(in: cancelBag)
  }
}

struct StubMonstersInteractor: MonstersInteractor {
  func storeAllMonstersFromWeb() {}
  func reloadEnemy(_ enemy: LoadableSubject<Monster>) {}
  func updateEnemy(monster: Monster, enemy: LoadableSubject<Monster>) {}
}
