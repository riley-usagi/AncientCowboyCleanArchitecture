extension Container {
  
  struct WebServices {
    
    let itemsWebService: ItemsWebService
    
    let monstersWebService: MonstersWebService
    
    let imagesWebService: ImagesWebService
    
    init(
      itemsWebService: ItemsWebService,
      monstersWebService: MonstersWebService,
      imagesWebService: ImagesWebService
    ) {
      self.itemsWebService    = itemsWebService
      self.monstersWebService = monstersWebService
      self.imagesWebService   = imagesWebService
    }
  }
}
