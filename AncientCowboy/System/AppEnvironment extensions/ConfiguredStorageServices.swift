extension AppEnvironment {
  
  static func configuredStorageServices() -> Container.StorageServices {
    
    let imagesStorageService = RealImagesStorageService()
    
    return .init(imagesStorageService: imagesStorageService)
  }
}
