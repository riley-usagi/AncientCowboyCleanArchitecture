import Foundation

extension AppEnvironment {
  
  static func configuredWebServices(session: URLSession) -> Container.WebServices {
    
    let keys: NSDictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "keys", ofType: "plist")!)!
    
    let itemsWebService     = RealItemsWebService(session: session, baseURL: keys["raspberry"] as! String)
    let monstersWebService  = RealMonstersWebService(session: session, baseURL: keys["raspberry"] as! String)
    let imagesWebService    = RealImagesWebService(session: session, baseURL: keys["someImagesServer"] as! String)
    
    return .init(
      itemsWebService: itemsWebService,
      monstersWebService: monstersWebService,
      imagesWebService: imagesWebService
    )
  }
}
