extension Container {
  
  struct FBServices {
    
    let heroesFBService: HeroesFBService
    
    init(heroesFBService: HeroesFBService) {
      self.heroesFBService = heroesFBService
    }
  }
}
