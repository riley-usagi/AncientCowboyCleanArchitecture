import CoreData
import Foundation

@objc(ItemModelObject)
public class ItemModelObject: NSManagedObject {
  
  static func item(by ingameid: Int) -> NSFetchRequest<ItemModelObject> {
    
    let request = newFetchRequest()
    
    let predicate = NSPredicate(format: "ingameid == %@", String(ingameid))
    
    request.predicate = predicate
    
    request.fetchLimit = 1
    
    return request
  }
  
  static func items(by ingameids: [Int]) -> NSFetchRequest<ItemModelObject> {
    
    let request = newFetchRequest()
    
    let predicate = NSPredicate(format: "ANY ingameid IN %@", ingameids)
    
    request.predicate = predicate
    
    return request
  }
}
