extension AppEnvironment {
  
  /// Процесс настройки сервисов для работы с локальным хранилищем
  /// - Returns: Контейнер со списком настроенных сервисов
  static func configuredDBServices() -> Container.DBServices {
    
    /// Точка доступа к CoreData
    let persistentStore = CoreDataStack()
    
    /// Сервис для работы с игровыми пердметами из локальной базы данных
    let itemsDBService      = RealItemsDBService(persistentStore: persistentStore)
    
    /// Сервис для работы с игровыми монстрами из локальной базы данных
    let monstersDBService   = RealMonstersDBService(persistentStore: persistentStore)
    
    /// Сервис для работы с игровыми пердметами в инвентаре героя из локальной базы данных
    let inventoryDBService  = RealInventoryDBService(persistentStore: persistentStore)
    
    return .init(
      itemsDBService: itemsDBService,
      monstersDBService: monstersDBService,
      inventoryDBService: inventoryDBService
    )
  }
}
