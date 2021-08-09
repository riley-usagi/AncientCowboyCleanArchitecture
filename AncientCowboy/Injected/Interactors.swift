extension Container {
  
  struct Interactors {
    
    let itemsInteractor: ItemsInteractor
    
    let heroesInteractor: HeroesInteractor
    
    let monstersInteractor: MonstersInteractor
    
    static var stub: Self {
      .init(
        itemsInteractor: StubItemsInteractor(),
        heroesInteractor: StubHeroesInteractor(),
        monstersInteractor: StubMonstersInteractor()
      )
    }
    
    init(
      itemsInteractor: ItemsInteractor,
      heroesInteractor: HeroesInteractor,
      monstersInteractor: MonstersInteractor
    ) {
      self.itemsInteractor    = itemsInteractor
      self.heroesInteractor   = heroesInteractor
      self.monstersInteractor = monstersInteractor
    }
  }
}
