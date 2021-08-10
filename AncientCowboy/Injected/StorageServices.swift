extension Container {
  
  struct StorageServices {
    
    let imagesStorageService: ImagesStorageService
    
    init(imagesStorageService: ImagesStorageService) {
      self.imagesStorageService = imagesStorageService
    }
  }
}
