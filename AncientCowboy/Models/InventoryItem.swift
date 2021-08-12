import CoreData
import SwiftUI

/// Модель объекта предмета из инвентаря
struct InventoryItem: Identifiable, Equatable {
  
  
  // MARK: - Параметры
  
  var id: String = UUID().uuidString
  var ingameid: Int
  var itemCount: Int = 1
  var itemType: Int
}


extension InventoryItem {
  init?(managedObject: InventoryItemModelObject) {
    self.init(
      ingameid: Int(managedObject.ingameid),
      itemCount: Int(managedObject.itemCount),
      itemType: Int(managedObject.itemType)
    )
  }
}

extension InventoryItem {
  
  /// Часть процесса сохранения игрового предмета в CoreData
  /// - Parameter context: Объект Контекста
  /// - Returns: Необязательный объект из Базы данных
  @discardableResult func store(in context: NSManagedObjectContext) -> InventoryItemModelObject? {
    
    guard let details = InventoryItemModelObject.insertNew(in: context) else { return nil }
    
    details.ingameid  = Int32(ingameid)
    details.itemCount = Int32(itemCount)
    details.itemType  = Int32(itemType)
    
    return details
  }
}
