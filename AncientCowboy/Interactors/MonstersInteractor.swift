import Combine
import SwiftUI

/// Интерактор для работы с Монстрами
protocol MonstersInteractor {
  func storeAllMonstersFromWeb()
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
}


struct StubMonstersInteractor: MonstersInteractor {
  func storeAllMonstersFromWeb() {}
}
