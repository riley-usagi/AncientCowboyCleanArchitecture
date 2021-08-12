extension Container {
  
  /// Список интеракторов
  struct Interactors {
    
    /// Интерактор для работы с Монстрами
    let monstersInteractor: MonstersInteractor
    
    /// Интерактор для работы с игровыми Предметам
    let itemsInteractor: ItemsInteractor
    
    /// Интерактор для работы с Инвентарём
    let inventoryInteractor: InventoryInteractor
    
    /// Интерактор для работы с Героями
    let heroesInteractor: HeroesInteractor
    
    /// Заглушка
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
