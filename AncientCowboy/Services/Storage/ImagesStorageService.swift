import Combine
import SwiftUI

protocol ImagesStorageService {
  func load(theme: ImageTheme, id: Int) -> AnyPublisher<UIImage?, Error>
  func save(image: UIImage, id: Int, theme: ImageTheme) -> AnyPublisher<UIImage, Error>
}


struct RealImagesStorageService: ImagesStorageService {
  
  let fileManager = FileManager.default
  
  func load(theme: ImageTheme, id: Int) -> AnyPublisher<UIImage?, Error> {
    let url = url()!
    
    let imagesFolderUrl: URL = url.appendingPathComponent(theme.rawValue + "Images")
    
    let fileURL = imagesFolderUrl.appendingPathComponent("\(id).gif")
    
    if fileManager.fileExists(atPath: fileURL.path) {
      let imageFromStorage = UIImage(contentsOfFile: fileURL.path)
      return Just<UIImage?>.withErrorType(imageFromStorage, Error.self)
    }
    
    return Just<UIImage?>.withErrorType(nil, Error.self)
  }
  
  func save(image: UIImage, id: Int, theme: ImageTheme) -> AnyPublisher<UIImage, Error> {
    let url = url()!
    
    let imagesFolderUrl: URL = url.appendingPathComponent(theme.rawValue + "Images")
    
    let fileURL = imagesFolderUrl.appendingPathComponent("\(id).gif")
    
    let fileContent = image.pngData()!
    
    fileManager.createFile(
      atPath: fileURL.path,
      contents: fileContent,
      attributes: [FileAttributeKey.creationDate : Date()]
    )
    
    return Just<UIImage>.withErrorType(image, Error.self)
  }
}


extension RealImagesStorageService {
  func url() -> URL? {
    guard let url = fileManager.urls(
      for: .documentDirectory, in: .userDomainMask
    ).first else { return nil }
    
    return url
  }
}

