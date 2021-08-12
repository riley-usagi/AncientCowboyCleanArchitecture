extension AppEnvironment {
  
  /// Процесс настройки интеракторов
  /// - Parameters:
  ///   - appState: Локальное динамическое хранилище
  ///   - webServices: Список web-сервисов
  ///   - dbServices: Список сервисов для работы с локальной базой данных
  ///   - fbServices: Список сервисов для работы с FireBase
  ///   - storageServices: Список сервисов для работы с локальным хранилищем
  /// - Returns: Настроенный список интеракторов
  static func configuredInteractors(
    appState: Store<AppState>,
    webServices: Container.WebServices,
    dbServices: Container.DBServices,
    fbServices: Container.FBServices,
    storageServices: Container.StorageServices
  ) -> Container.Interactors {
    
    /// Интерактор для работы с игровыми предметами
    let itemsInteractor = RealItemsInteractor(
      appState: appState,
      webService: webServices.itemsWebService,
      dbService: dbServices.itemsDBService
    )
    
    /// Инетрактор для работы с Героями
    let heroesInteractor = RealHeroesInteractor(
      appState: appState,
      fbService: fbServices.heroesFBService
    )
    
    /// Интерактор для работы с Монстрами
    let monstersInteractor = RealMonstersInteractor(
      appState: appState,
      dbService: dbServices.monstersDBService,
      webService: webServices.monstersWebService,
      imagesStorageService: storageServices.imagesStorageService,
      imagesWebService: webServices.imagesWebService
    )
    
    /// Интерактор для работы с инвентарём
    let inventoryInteractor = RealInventoryInteractor(
      inventoryDBService: dbServices.inventoryDBService,
      itemsDBService: dbServices.itemsDBService
    )
    
    return .init(
      monstersInteractor: monstersInteractor,
      itemsInteractor: itemsInteractor,
      inventoryInteractor: inventoryInteractor,
      heroesInteractor: heroesInteractor
    )
  }
}
