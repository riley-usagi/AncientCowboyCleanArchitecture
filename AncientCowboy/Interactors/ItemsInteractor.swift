import Combine
import SwiftUI

/// Инерактор для работы с игровыми Предметами
protocol ItemsInteractor {
  
  /// Процесс сохранения всех предметов в локальную базу из интернета
  func storeAllItemsFromWeb()
}

/// Инерактор для работы с игровыми Предметами
struct RealItemsInteractor: ItemsInteractor {
  
  /// Объект динамического хранилища
  let appState: Store<AppState>
  
  /// Web-сервис для работы с Предметами на удалённом сервере
  let webService: ItemsWebService
  
  /// Сервис для работы с игровыми Предметами в локальной базе
  let dbService: ItemsDBService
  
  /// Мешок для подписок
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


// MARK: - Stub

struct StubItemsInteractor: ItemsInteractor {
  func storeAllItemsFromWeb() {}
}
