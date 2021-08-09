import Combine
import Foundation

/// Web-сервис для работы с Монстрами на удалённом сервере
protocol MonstersWebService: WebService {
  
  /// Получаение монстров
  /// - Parameter gameids: Список id'шников искомых монстров
  func loadMonstersFromWeb() -> AnyPublisher<[Monster], Error>
}

/// Web-сервис для работы с Монстрами на удалённом сервере
struct RealMonstersWebService: MonstersWebService {
  
  
  // MARK: - Параметры
  
  var session: URLSession
  var baseURL: String
  var bgQueue: DispatchQueue = DispatchQueue(label: "bg_parse_queue")
  
  
  // MARK: - Конструкторы
  
  init(session: URLSession, baseURL: String) {
    self.session = session
    self.baseURL = baseURL
  }
  
  
  // MARK: - Методы
  
  func loadMonstersFromWeb() -> AnyPublisher<[Monster], Error> {
    let request: AnyPublisher<[Monster], Error> = call(endpoint: MonstersAPI.monsters)
    
    return request
      .eraseToAnyPublisher()
  }
}


// MARK: - Endpoints

extension RealMonstersWebService {
  
  /// Список адресов запроса для получения данных об игровых предметах
  enum MonstersAPI {
    case monsters
  }
}



// MARK: - API to APICall
extension RealMonstersWebService.MonstersAPI: APICall {
  
  var path: String {
    switch self {
    case .monsters:
      return "/monsters/"
    }
  }
  
  var method: String {
    switch self {
    case .monsters:
      return "GET"
    }
  }
  
  var headers: [String: String]? {
    return ["Accept": "application/json"]
  }
  
  func body() throws -> Data? {
    return nil
  }
}
