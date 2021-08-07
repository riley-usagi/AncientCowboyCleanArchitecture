import Combine
import CoreData

protocol PersistentStore {
  typealias DBOperation<Result> = (NSManagedObjectContext) throws -> Result
  
//  func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error>
}

struct CoreDataStack: PersistentStore {
  
  private let container: NSPersistentContainer
  private let bgQueue = DispatchQueue(label: "coredata")
  private let isStoreLoaded = CurrentValueSubject<Bool, Error>(false)
  
  init(
    directory: FileManager.SearchPathDirectory    = .documentDirectory,
    domainMask: FileManager.SearchPathDomainMask  = .userDomainMask
  ) {
    container = NSPersistentContainer(name: "AncientCowboyDataBase")
    
    if let url = dbFileURL(directory, domainMask) {
      let store = NSPersistentStoreDescription(url: url)
      container.persistentStoreDescriptions = [store]
    }
    
    bgQueue.async { [weak isStoreLoaded, weak container] in
      
      container?.loadPersistentStores(completionHandler: { storeDescription, error in
        
        DispatchQueue.main.async {
          
          if let error = error {
            isStoreLoaded?.send(completion: .failure(error))
          } else {
            container?.viewContext.configureAsReadOnlyContext()
            isStoreLoaded?.value = true
          }
        }
      })
    }
  }
}


extension CoreDataStack {
  private func dbFileURL(
    _ directory: FileManager.SearchPathDirectory,
    _ domainMask: FileManager.SearchPathDomainMask
  ) -> URL? {
    
    return FileManager.default.urls(
      for: directory, in: domainMask
    )
    .first?
    .appendingPathComponent("db.sql")
  }
}
