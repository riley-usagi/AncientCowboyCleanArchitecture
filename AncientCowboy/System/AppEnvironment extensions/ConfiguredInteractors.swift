extension AppEnvironment {
  
  static func configuredInteractors(
    appState: Store<AppState>,
    webServices: Container.WebServices,
    dbServices: Container.DBServices,
    fbServices: Container.FBServices
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
    
    return .init(
      itemsInteractor: itemsInteractor,
      heroesInteractor: heroesInteractor
    )
  }
}
