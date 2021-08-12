import Foundation

/// Список возможных папко для изображений
enum ImageTheme: String, CaseIterable {
  case monsters, items
}


extension Container {
  
  /// Список сервисов для работы с локальным хранилищем
  struct StorageServices {
    
    /// Менеджер файлов
    let manager = FileManager.default
    
    /// Сервис длоя работы с локальными изображениями
    let imagesStorageService: ImagesStorageService
    
    init(imagesStorageService: ImagesStorageService) {
      
      // Создаём необходимые папки, если они ещё не быи созданны ранее
      for imageType in ImageTheme.allCases {
        
        let url = url(manager)!.appendingPathComponent(imageType.rawValue + "Images")
        
        let path = url.path
        
        if !manager.fileExists(atPath: path) {
          do {
            try manager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
          } catch {
            print(String(describing: error))
          }
        }
      }
      
      self.imagesStorageService = imagesStorageService
    }
  }
  
}

/// Ссылка до папки Documents в текущем бандле
/// - Parameter manager: Объет файлового менеджера
/// - Returns: Объект ссылки
fileprivate func url(_ manager: FileManager) -> URL? {
  guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
    return nil
  }
  
  return url
}
