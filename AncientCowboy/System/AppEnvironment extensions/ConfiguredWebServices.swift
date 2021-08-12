import Foundation

extension AppEnvironment {
  
  /// Процесс настройки web-сервисов
  /// - Parameter session: Обхект настроенной сессии
  /// - Returns: Контейнер с настроенным списком web-сервисов
  static func configuredWebServices(session: URLSession) -> Container.WebServices {
    
    let keys: NSDictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "keys", ofType: "plist")!)!
    
    /// Сервис для работы с игровыми Предметами на удалённом сервере
    let itemsWebService     = RealItemsWebService(session: session, baseURL: keys["raspberry"] as! String)
    
    /// Сервис для работы с игровыми Монстрами на удалённом сервере
    let monstersWebService  = RealMonstersWebService(session: session, baseURL: keys["raspberry"] as! String)
    
    /// Сервис для работы с изображениями на удалённом сервере
    let imagesWebService    = RealImagesWebService(session: session, baseURL: keys["someImagesServer"] as! String)
    
    return .init(
      itemsWebService: itemsWebService,
      monstersWebService: monstersWebService,
      imagesWebService: imagesWebService
    )
  }
}
