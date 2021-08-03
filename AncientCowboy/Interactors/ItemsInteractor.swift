import SwiftUI

protocol ItemsInteractor {
  func storeAllItemsFromWeb()
}

struct RealItemsInteractor: ItemsInteractor {
  
  let appState: Store<AppState>
  
  let webService: ItemsWebService
  
  func storeAllItemsFromWeb() {
    print("Loading items from web")
  }
}

struct StubItemsInteractor: ItemsInteractor {
  func storeAllItemsFromWeb() {}
}
