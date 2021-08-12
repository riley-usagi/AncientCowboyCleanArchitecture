import Combine
import SwiftUI

/// Интерактор для работы с Героями
protocol HeroesInteractor {
  
  /// Загрузка данных о Героя из FireStore
  /// - Parameter completion: Замыкание с данными о герое
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void)
  
  
  /// Процесс создания Героя на удалённом сервере
  /// - Parameters:
  ///   - heroFromForm: Данные о Героя из формы на экране создания
  ///   - completion: Замыкание с результатами создания Героя
  func createHero(_ heroFromForm: Hero, completion: @escaping (Result<Bool, Error>) -> Void)
}

/// Интерактор для работы с Героями
struct RealHeroesInteractor: HeroesInteractor {
  
  /// Объект локального динамического хранилища
  let appState: Store<AppState>
  
  /// Сервис для работы с FireStore
  let fbService: HeroesFBService
  
  /// Уникальный идентификатор устройства
  let deviceID: String = UIDevice.current.identifierForVendor!.uuidString
  
  /// Мешок для подписок
  let cancelBag = CancelBag()
  
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void) {
    
    // Запрашивается информация о герое с сервера FireStore
    fbService.loadHeroFromServer(deviceID: deviceID)
      .flatMap { optionalHero -> AnyPublisher<Bool, Error> in
        if let hero = optionalHero {
          
          // Сохранение Героя в динамическое хранилище
          appState.value.hero = hero
          
          return Just<Bool>.withErrorType(true, Error.self)
        } else {
          return Just<Bool>.withErrorType(false, Error.self)
        }
      }
      
      // Результат запроса с удалённого сервера
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
  
  func createHero(_ heroFromForm: Hero, completion: @escaping (Result<Bool, Error>) -> Void) {
    
    fbService
      
      // Процесс создания героя на удалённом сервере FireBase
      .createHeroInFireStore(heroFromForm, deviceID: deviceID)
      .sinkToResult { heroCreatingResultAsBool in
        switch heroCreatingResultAsBool {
        
        case .success:
          
          // Сохранение Героя в динамическое хранилище
          appState.value.hero = heroFromForm
          
          completion(.success(true))
        case let .failure(error):
          completion(.failure(error))
        }
      }
      .store(in: cancelBag)
    
  }
}

// MARK: - Stub

struct StubHeroesInteractor: HeroesInteractor {
  func loadHeroFromFireStore(completion: @escaping (Result<Bool, Error>) -> Void) {}
  func createHero(_ heroFromForm: Hero, completion: @escaping (Result<Bool, Error>) -> Void) {}
}
