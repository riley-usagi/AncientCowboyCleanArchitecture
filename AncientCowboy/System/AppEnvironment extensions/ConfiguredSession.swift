import Foundation

extension AppEnvironment {
  
  static func configuredSession() -> URLSession {
    let configuration = URLSessionConfiguration.default
    
    configuration.timeoutIntervalForRequest     = 60
    configuration.timeoutIntervalForResource    = 120
    configuration.waitsForConnectivity          = true
    configuration.httpMaximumConnectionsPerHost = 5
    configuration.requestCachePolicy            = .returnCacheDataElseLoad
    configuration.urlCache                      = .shared

    return URLSession(configuration: configuration)
  }
}
