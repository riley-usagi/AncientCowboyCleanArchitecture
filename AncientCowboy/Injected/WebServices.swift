extension Container {
  
  /// Список сервисов для работы с удалёнными серверами
  struct WebServices {
    
    /// Сервис для работы с игровыми предметами на удалённом сервере
    let itemsWebService: ItemsWebService
    
    /// Сервис для работы с монстрами на удалённом сервере
    let monstersWebService: MonstersWebService
    
    /// Сервис для работы с изображениями на удалённом сервере
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
