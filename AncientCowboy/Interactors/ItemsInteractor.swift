import SwiftUI

protocol ItemsInteractor {
  func storeAllItemsFromWeb()
}

struct RealItemsInteractor: ItemsInteractor {
  
  let appState: Store<AppState>
  
  func storeAllItemsFromWeb() {
    print("Loading items from web")
  }
}

struct StubItemsInteractor: ItemsInteractor {
  func storeAllItemsFromWeb() {}
}
