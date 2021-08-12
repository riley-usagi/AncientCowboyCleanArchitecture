extension AppEnvironment {
  
  /// Процесс настройки сервисов для работы с локальным хранилищем
  /// - Returns: Контейнер со списком сервисов
  static func configuredStorageServices() -> Container.StorageServices {
    
    /// Сервис для работы с локальными изображениями
    let imagesStorageService = RealImagesStorageService()
    
    return .init(imagesStorageService: imagesStorageService)
  }
}
