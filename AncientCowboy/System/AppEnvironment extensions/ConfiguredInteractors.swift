extension AppEnvironment {
  
  static func configuredInteractors(
    appState: Store<AppState>,
    webServices: Container.WebServices
  ) -> Container.Interactors {
    
    /// Интерактор для работы с игровыми предметами
    let itemsInteractor = RealItemsInteractor(
      appState: appState,
      webService: webServices.itemsWebService
    )
    
    return .init(itemsInteractor: itemsInteractor)
  }
}
