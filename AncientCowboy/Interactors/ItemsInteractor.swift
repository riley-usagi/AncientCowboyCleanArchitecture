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
    
    loadItemsFromWeb()
      .sinkToResult { itemsListAsResult in
        switch itemsListAsResult {
        
        case .success:
          print(try? itemsListAsResult.get().first?.name)
        case let .failure(error):
          print(String(describing: error))
        }
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
