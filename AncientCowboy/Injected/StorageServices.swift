import Foundation

enum ImageTheme: String, CaseIterable {
  case monsters, items
}


extension Container {
  
  struct StorageServices {
    
    let manager = FileManager.default
    
    let imagesStorageService: ImagesStorageService
    
    init(imagesStorageService: ImagesStorageService) {
      
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

fileprivate func url(_ manager: FileManager) -> URL? {
  guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
    return nil
  }
  return url
}
