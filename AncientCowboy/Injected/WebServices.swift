extension Container {
  
  struct WebServices {
    
    let itemsWebService: ItemsWebService
    
    init(itemsWebService: ItemsWebService) {
      self.itemsWebService = itemsWebService
    }
  }
}
