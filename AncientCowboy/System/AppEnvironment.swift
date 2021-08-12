/// Объект окружения приложения
struct AppEnvironment {
  
  /// Объект контейнера с настроенными зависимостями
  let container: Container
}


extension AppEnvironment {
  
  /// Метод процесса настройки зависимостей
  /// - Returns: Объект окружения
  static func bootstrap() -> AppEnvironment {
    
    /// Локальное динамическое хранилище
    let appState    = Store<AppState>(AppState())
    
    /// Настроенный объект сессии для запросов в интернет
    let session     = configuredSession()
    
    /// Список web-сервисов
    let webServices = configuredWebServices(session: session)
    
    /// Список сервисов для работы с локальной базой данных
    let dbServices  = configuredDBServices()
    
    /// Список сервисов для работы с FireBase
    let fbServices  = configuredFBServices()
    
    /// Список сервисов для работы с локальным хранилищем
    let storageServices = configuredStorageServices()
    
    /// Список настроенных интеракторов
    let interactors = configuredInteractors(
      appState: appState,
      webServices: webServices,
      dbServices: dbServices,
      fbServices: fbServices,
      storageServices: storageServices
    )
    
    /// Контейнер с зависимостями
    let container = Container(
      appState: appState,
      interactors: interactors
    )
    
    return AppEnvironment(container: container)
  }
}
