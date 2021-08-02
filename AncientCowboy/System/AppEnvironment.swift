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
    let appState = Store<AppState>(AppState())
    
    /// Список настроенных интеракторов
    let interactors = configuredInteractors(
      appState: appState
    )
    
    /// Контейнер с зависимостями
    let container = Container(interactors: interactors)
    
    return AppEnvironment(container: container)
  }
}
