extension AppEnvironment {
  
  static func configuredDBServices() -> Container.DBServices {
    
    let persistentStore = CoreDataStack()
    
    let itemsDBService      = RealItemsDBService(persistentStore: persistentStore)
    let monstersDBService   = RealMonstersDBService(persistentStore: persistentStore)
    let inventoryDBService  = RealInventoryDBService(persistentStore: persistentStore)
    
    return .init(
      itemsDBService: itemsDBService,
      monstersDBService: monstersDBService,
      inventoryDBService: inventoryDBService
    )
  }
}
