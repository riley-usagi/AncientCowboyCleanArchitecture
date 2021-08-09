import Combine
import SwiftUI

protocol HeroesInteractor {
  //func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void)
}

struct RealHeroesInteractor: HeroesInteractor {
  let appState: Store<AppState>
  
  #warning("FireBase service")
  
  let deviceID: String = UIDevice.current.identifierForVendor!.uuidString
}

struct StubHeroesInteractor: HeroesInteractor {}
