extension AppEnvironment {
  
  static func configuredDBSservices() -> Container.DBServices {
    
    let persistentStore = CoreDataStack()
    
    let itemsDBService  = RealItemsDBService(persistentStore: persistentStore)
    
    return .init(itemsDBService: itemsDBService)
  }
}
