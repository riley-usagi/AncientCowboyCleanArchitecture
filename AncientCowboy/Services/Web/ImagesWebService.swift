import Combine
import UIKit

protocol ImagesWebService: WebService {
  func load(imageURLString: String) -> AnyPublisher<UIImage, Error>
}

struct RealImagesWebService: ImagesWebService {
  
  let session: URLSession
  let baseURL: String
  let bgQueue: DispatchQueue = DispatchQueue(label: "bg_parse_queue")
  
  init(session: URLSession, baseURL: String) {
    self.session = session
    self.baseURL = baseURL
  }
  
  func load(imageURLString: String) -> AnyPublisher<UIImage, Error> {
    let completeURL = URL(string: baseURL + imageURLString)!
    
    let request = URLRequest(url: completeURL)
    
    return session.dataTaskPublisher(for: request)
      .tryMap { data, response in
        
        guard let image = UIImage(data: data) else {
          throw APIError.imageProcessing([request])
        }
        
        return image
      }
      .eraseToAnyPublisher()
  }
}
