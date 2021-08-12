import Combine
import SwiftUI

/// Сервис для работы с изобаржениями из локального хранилища
protocol ImagesStorageService {
  
  /// Загрузка изображения из хранилища
  /// - Parameters:
  ///   - theme: Тема изображения
  ///   - id: id
  func load(theme: ImageTheme, id: Int) -> AnyPublisher<UIImage?, Error>
  
  /// Процесс сохранения изображения в локальное хранилище
  /// - Parameters:
  ///   - image: Объект Изображения
  ///   - id: id
  ///   - theme: Тема изображения
  func save(image: UIImage, id: Int, theme: ImageTheme) -> AnyPublisher<UIImage, Error>
}


/// Сервис для работы с изобаржениями из локального хранилища
struct RealImagesStorageService: ImagesStorageService {
  
  /// Объект файлового менеджера
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

