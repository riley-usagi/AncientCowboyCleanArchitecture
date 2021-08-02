extension AppEnvironment {
  
  static func configuredInteractors(
    appState: Store<AppState>
  ) -> Container.Interactors {
    
    /// Интерактор для работы с игровыми предметами
    let itemsInteractor = RealItemsInteractor(appState: appState)
    
    return .init(itemsInteractor: itemsInteractor)
  }
}
