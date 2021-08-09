import CoreData
import Foundation

@objc(InventoryItemModelObject)
public class InventoryItemModelObject: NSManagedObject {
  
  static func item(by id: Int) -> NSFetchRequest<InventoryItemModelObject> {
    let request = newFetchRequest()
    
    let predicate = NSPredicate(format: "ingameid == %@", String(id))
    
    request.predicate = predicate
    
    request.fetchLimit = 1
    
    return request
  }
  
  static func items() -> NSFetchRequest<InventoryItemModelObject> {
    
    let request = newFetchRequest()
    
    return request
  }
}
