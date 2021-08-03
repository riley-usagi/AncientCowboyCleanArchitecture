import Foundation

enum APIError: Swift.Error {
  case invalidURL
  
  case httpCode(Int)
  
  case unexpectedResponse
  
  case imageProcessing([URLRequest])
  
  var errorDescription: String? {
    switch self {
    
    case .invalidURL:
      return "Invalid URL"
    case let .httpCode(code):
      return "Unexpected HTTP code: \(code)"
    case .unexpectedResponse:
      return "Unexpected response from server"
    case .imageProcessing:
      return "Unable to load image"
    }
  }
  
}
