extension Container {
  
  /// Сервисы для работы с локальной базой данных
  struct DBServices {
    
    /// Сервис для работы с игровыми вещами из локальной базы данных
    let itemsDBService: ItemsDBService
    
    /// Сервис для работы с игровыми монстрами из локальной базы данных
    let monstersDBService: MonstersDBService
    
    /// Сервис для работы с игровыми инвентарём из локальной базы данных
    let inventoryDBService: InventoryDBService
    
    init(
      itemsDBService: ItemsDBService,
      monstersDBService: MonstersDBService,
      inventoryDBService: InventoryDBService) {
      self.itemsDBService     = itemsDBService
      self.monstersDBService  = monstersDBService
      self.inventoryDBService = inventoryDBService
    }
  }
}
