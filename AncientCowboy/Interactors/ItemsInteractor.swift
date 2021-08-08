import Combine
import SwiftUI

protocol ItemsInteractor {
  func storeAllItemsFromWeb()
}

struct RealItemsInteractor: ItemsInteractor {
  
  let appState: Store<AppState>
  
  let webService: ItemsWebService
  
  let dbService: ItemsDBService
  
  let cancelBag = CancelBag()
  
  func storeAllItemsFromWeb() {
    
    webService
      .loadItemsFromWeb()
      .flatMap { [dbService] items -> AnyPublisher<Void, Error> in
        dbService.storeAllItemsFromWeb(items)
      }
      .sinkToResult { _ in
        appState.value.dataPreloaded = true
      }
      .store(in: cancelBag)
  }
  
  private func loadItemsFromWeb() -> AnyPublisher<[Item], Error> {
    return webService
      .loadItemsFromWeb()
      .eraseToAnyPublisher()
  }
}

struct StubItemsInteractor: ItemsInteractor {
  func storeAllItemsFromWeb() {}
}
