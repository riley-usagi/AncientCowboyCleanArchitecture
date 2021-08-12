extension AppEnvironment {
  
  /// Процесс настройки сервисов для работы с FireBase
  /// - Returns: Контейнер со списком сервисов
  static func configuredFBServices() -> Container.FBServices {
    
    /// Сервис для работы с героями из FireStore
    let heroesFBService = RealHeroesFBService()
    
    return .init(heroesFBService: heroesFBService)
  }
}
