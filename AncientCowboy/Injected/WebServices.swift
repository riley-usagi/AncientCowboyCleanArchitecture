extension Container {
  
  struct WebServices {
    
    let itemsWebService: ItemsWebService
    
    let monstersWebService: MonstersWebService
    
    init(
      itemsWebService: ItemsWebService,
      monstersWebService: MonstersWebService
    ) {
      self.itemsWebService    = itemsWebService
      self.monstersWebService = monstersWebService
    }
  }
}
