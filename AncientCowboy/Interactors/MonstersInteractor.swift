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
  
  let imagesStorageService: ImagesStorageService
  
  let imagesWebService: ImagesWebService
  
  func reloadEnemy(_ enemy: LoadableSubject<Monster>) {
    
    enemy.wrappedValue.setIsLoading(cancelBag: cancelBag)
    
    let randomMonsterId: Int = [1002, 1113, 1079, 1183, 1009].randomElement()!
    
    imagesStorageService
    
      .load(theme: .monsters, id: randomMonsterId)
    
      .flatMap { optionalImage -> AnyPublisher<UIImage, Error> in
        if let image = optionalImage {
          return Just<UIImage>.withErrorType(image, Error.self)
        } else {
          return checkAndSaveImage(id: randomMonsterId)
        }
      }
    
      .zip(dbService.monster(ingameid: randomMonsterId))
    
      .flatMap { enemyImage, optionalMonster -> AnyPublisher<Monster?, Error> in
        if var monster = optionalMonster {
          monster.image = enemyImage
          
          return Just<Monster?>.withErrorType(monster, Error.self)
        } else {
          return Just<Monster?>.withErrorType(nil, Error.self)
        }
      }
    
      .sinkToLoadable { optionalMonster in
        enemy.wrappedValue = optionalMonster.unwrap()
      }
    
      .store(in: cancelBag)
  }
  
  func checkAndSaveImage(id: Int) -> AnyPublisher<UIImage, Error> {
    return imagesWebService
      
      .loadMonsterImage(ingameid: id)
    
      .flatMap { image -> AnyPublisher<UIImage, Error> in
        imagesStorageService.save(image: image, id: id, theme: .monsters)
      }
    
      .eraseToAnyPublisher()
    
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
