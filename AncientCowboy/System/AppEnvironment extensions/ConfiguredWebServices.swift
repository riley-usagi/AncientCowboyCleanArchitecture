import Foundation

extension AppEnvironment {
  
  static func configuredWebServices(session: URLSession) -> Container.WebServices {
    
    let keys: NSDictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "keys", ofType: "plist")!)!
    
    let itemsWebService = RealItemsWebService(session: session, baseURL: keys["raspberry"] as! String)
    
    return .init(itemsWebService: itemsWebService)
  }
}
