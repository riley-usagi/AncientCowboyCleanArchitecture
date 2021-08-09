extension Container {
  
  struct DBServices {
    let itemsDBService: ItemsDBService
    
    let monstersDBService: MonstersDBService
    
    init(
      itemsDBService: ItemsDBService,
      monstersDBService: MonstersDBService) {
      self.itemsDBService     = itemsDBService
      self.monstersDBService  = monstersDBService
    }
  }
}
