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
    
    /// Настроенный
    let session     = configuredSession()
    
    let webServices = configuredWebServices(session: session)
    
    let dbServices  = configuredDBSservices()
    
    /// Список настроенных интеракторов
    let interactors = configuredInteractors(
      appState: appState,
      webServices: webServices,
      dbServices: dbServices
    )
    
    /// Контейнер с зависимостями
    let container = Container(
      appState: appState,
      interactors: interactors
    )
    
    return AppEnvironment(container: container)
  }
}
