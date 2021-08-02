extension Container {
  
  struct Interactors {
    
    let itemsInteractor: ItemsInteractor
    
    static var stub: Self {
      .init(itemsInteractor: StubItemsInteractor())
    }
    
    init(itemsInteractor: ItemsInteractor) {
      self.itemsInteractor = itemsInteractor
    }
  }
}
