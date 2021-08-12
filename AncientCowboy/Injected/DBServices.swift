extension Container {
  
  struct DBServices {
    let itemsDBService: ItemsDBService
    
    let monstersDBService: MonstersDBService
    
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
