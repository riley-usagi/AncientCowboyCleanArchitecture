extension Container {
  
  struct Interactors {
    
    let itemsInteractor: ItemsInteractor
    
    let heroesInteractor: HeroesInteractor
    
    static var stub: Self {
      .init(
        itemsInteractor: StubItemsInteractor(),
        heroesInteractor: StubHeroesInteractor()
      )
    }
    
    init(
      itemsInteractor: ItemsInteractor,
      heroesInteractor: HeroesInteractor
    ) {
      self.itemsInteractor  = itemsInteractor
      self.heroesInteractor = heroesInteractor
    }
  }
}
