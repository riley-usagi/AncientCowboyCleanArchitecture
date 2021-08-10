extension AppEnvironment {
  
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
    
    let heroesInteractor = RealHeroesInteractor(
      appState: appState,
      fbService: fbServices.heroesFBService
    )
    
    let monstersInteractor = RealMonstersInteractor(
      appState: appState,
      dbService: dbServices.monstersDBService,
      webService: webServices.monstersWebService,
      imagesStorageService: storageServices.imagesStorageService,
      imagesWebService: webServices.imagesWebService
    )
    
    return .init(
      itemsInteractor: itemsInteractor,
      heroesInteractor: heroesInteractor,
      monstersInteractor: monstersInteractor
    )
  }
}
