extension Container {
  
  struct DBServices {
    let itemsDBService: ItemsDBService
    
    init(itemsDBService: ItemsDBService) {
      self.itemsDBService = itemsDBService
    }
  }
}
