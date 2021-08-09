import Combine
import CoreData

protocol PersistentStore {
  typealias DBOperation<Result> = (NSManagedObjectContext) throws -> Result
  
  func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error>
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
  
  
  // MARK: - Methods
  
  
  func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error> {
    let update = Future<Result, Error> { [weak bgQueue, weak container] promise in
      bgQueue?.async {
        
        guard let context = container?.newBackgroundContext() else { return }
        
        context.configureAsUpdateContext()
        
        context.performAndWait {
          do {
            let result = try operation(context)
            if context.hasChanges {
              try context.save()
            }
            context.reset()
            promise(.success(result))
          } catch {
            context.reset()
            promise(.failure(error))
          }
        }
      }
    }
    
    return onStoreIsReady
      .flatMap { update }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  private var onStoreIsReady: AnyPublisher<Void, Error> {
    return isStoreLoaded
      .filter { $0 }
      .map { _ in }
      .eraseToAnyPublisher()
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
