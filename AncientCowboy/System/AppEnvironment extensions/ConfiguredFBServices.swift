extension AppEnvironment {
  
  static func configuredFBServices() -> Container.FBServices {

    let heroesFBService = RealHeroesFBService()
    
    return .init(heroesFBService: heroesFBService)
  }
}
