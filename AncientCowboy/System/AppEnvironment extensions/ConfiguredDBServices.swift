extension AppEnvironment {
  
  static func configuredDBServices() -> Container.DBServices {
    
    let persistentStore = CoreDataStack()
    
    let itemsDBService  = RealItemsDBService(persistentStore: persistentStore)
    
    return .init(itemsDBService: itemsDBService)
  }
}
