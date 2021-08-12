import Combine
import CoreData

protocol InventoryDBService {
  func loadInventoryItems() -> AnyPublisher<LazyList<InventoryItem>, Error>
  func saveItemToInventory(by id: Int, itemType: Int)
}

struct RealInventoryDBService: InventoryDBService {
  let persistentStore: PersistentStore
  
  func loadInventoryItems() -> AnyPublisher<LazyList<InventoryItem>, Error> {
    
    let fetchRequest = InventoryItemModelObject.items()
    
    return persistentStore
      .fetch(fetchRequest) {
        InventoryItem(managedObject: $0)
      }
      .eraseToAnyPublisher()
  }
  
  func saveItemToInventory(by id: Int, itemType: Int) {
    
    let cancelBag = CancelBag()
    
    persistentStore
      .update { context in
        
        
        /// Запрос на поиск предмета в инвентаре
        let requestForFindingItemInInventory = InventoryItemModelObject.item(by: id)
        
        
        // Если предмет в инвентаре уже есть
        if let inventoryItemForUpdate = try context.fetch(requestForFindingItemInInventory).first {
          
          let itemCount = inventoryItemForUpdate.itemCount
          
          inventoryItemForUpdate.setValue(itemCount + 1, forKey: "itemCount")
          
          try context.save()
        }
        
        /// Если же предмета в инвентаре ещё нет, то создаём запись
        else {
          InventoryItem(ingameid: id, itemType: itemType).store(in: context)
        }
      }
      .sinkToResult { _ in }
      .store(in: cancelBag)
  }
}
