extension Container {
  
  struct Interactors {
    
    let monstersInteractor: MonstersInteractor
    
    let itemsInteractor: ItemsInteractor
    
    let inventoryInteractor: InventoryInteractor
    
    let heroesInteractor: HeroesInteractor
    
    static var stub: Self {
      .init(
        monstersInteractor: StubMonstersInteractor(),
        itemsInteractor: StubItemsInteractor(),
        inventoryInteractor: StubInventoryInteractor(),
        heroesInteractor: StubHeroesInteractor()
      )
    }
    
    init(
      monstersInteractor: MonstersInteractor,
      itemsInteractor: ItemsInteractor,
      inventoryInteractor: InventoryInteractor,
      heroesInteractor: HeroesInteractor
    ) {
      self.monstersInteractor   = monstersInteractor
      self.itemsInteractor      = itemsInteractor
      self.inventoryInteractor  = inventoryInteractor
      self.heroesInteractor     = heroesInteractor
    }
  }
}
