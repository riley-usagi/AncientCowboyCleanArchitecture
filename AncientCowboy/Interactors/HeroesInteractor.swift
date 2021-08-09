import Combine
import SwiftUI

protocol HeroesInteractor {
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void)
}

struct RealHeroesInteractor: HeroesInteractor {
  
  let appState: Store<AppState>
  
  let fbService: HeroesFBService
  
  let deviceID: String = UIDevice.current.identifierForVendor!.uuidString
  
  let cancelBag = CancelBag()
  
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void) {
    
    fbService.loadHeroFromServer(deviceID: deviceID)
      .flatMap { optionalHero -> AnyPublisher<Bool, Error> in
        if let hero = optionalHero {
          appState.value.hero = hero
          
          return Just<Bool>.withErrorType(true, Error.self)
        } else {
          return Just<Bool>.withErrorType(false, Error.self)
        }
      }
      .sinkToResult { loadingHeroFromServerResultAsBool in
        
        switch loadingHeroFromServerResultAsBool {
        
        case .success:
          completion(.success(true))
        case .failure:
          completion(.failure(FireBaseError.heroNotFound))
        }
      }
      .store(in: cancelBag)
    
  }
}

struct StubHeroesInteractor: HeroesInteractor {
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void) {}
}
