extension Container {
  
  /// Сервисы для работы с FireBase
  struct FBServices {
    
    /// Сервис для работы с Героями из FireBase
    let heroesFBService: HeroesFBService
    
    init(heroesFBService: HeroesFBService) {
      self.heroesFBService = heroesFBService
    }
  }
}
