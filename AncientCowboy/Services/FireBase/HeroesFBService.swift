import Combine
import FirebaseFirestore
import SwiftUI

protocol HeroesFBService {
  func loadHeroFromServer(deviceID: String) -> AnyPublisher<Hero?, Error>
  func createHeroInFireStore(_ heroFromForm: Hero, deviceID: String) -> AnyPublisher<Bool, Error>
}

struct RealHeroesFBService: HeroesFBService {
  
  func loadHeroFromServer(deviceID: String) -> AnyPublisher<Hero?, Error> {
    
    return Future<Hero?, Error> { promise in
      
      let fireStoreCollection = Firestore.firestore().collection("heroes")
      
      let heroDocumentByDeviceID = fireStoreCollection.document(deviceID)
      
      heroDocumentByDeviceID.getDocument { document, error in
        
        if let document = document, document.exists {
          let receivedData = document.data()!
          
          let hero: Hero = Hero(
            name: receivedData["name"] as! String,
            str: receivedData["str"] as! Int,
            agi: receivedData["agi"] as! Int,
            vit: receivedData["vit"] as! Int,
            int: receivedData["int"] as! Int,
            dex: receivedData["dex"] as! Int,
            luk: receivedData["luk"] as! Int
          )
          
          promise(.success(hero))
          
        } else {
          promise(.failure(FireBaseError.heroNotFound))
        }
      }
      
    }.eraseToAnyPublisher()
    
  }
  
  func createHeroInFireStore(_ heroFromForm: Hero, deviceID: String) -> AnyPublisher<Bool, Error> {
    
    return Future<Bool, Error> { promise in
      
      let fireStoreCollection = Firestore.firestore().collection("heroes")
      
      fireStoreCollection.document(deviceID).setData(
        [
          "name": heroFromForm.name,
          "str": heroFromForm.str,
          "agi": heroFromForm.agi,
          "vit": heroFromForm.vit,
          "int": heroFromForm.int,
          "dex": heroFromForm.dex,
          "luk": heroFromForm.luk,
          "zeny": heroFromForm.zeny
        ]
      ) { error in
        if error != nil {
          promise(.failure(FireBaseError.heroCreatingError))
        } else {
          promise(.success(true))
        }
      }
      
    }.eraseToAnyPublisher()
  }
}


enum FireBaseError: Swift.Error {
  case heroCreatingError
  case heroNotFound
}

extension FireBaseError {
  
  var errorDescription: String? {
    switch self {
    case .heroCreatingError:
      return "Hero creating error"
      
    case .heroNotFound:
      return "Hero not found"
    }
  }
}
