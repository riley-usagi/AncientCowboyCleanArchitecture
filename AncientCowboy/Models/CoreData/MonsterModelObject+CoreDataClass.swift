import Foundation
import CoreData

@objc(MonsterModelObject) public class MonsterModelObject: NSManagedObject {
  
  static func justOneMonster() -> NSFetchRequest<MonsterModelObject> {
    let request = newFetchRequest()
    request.fetchLimit = 1
    return request
  }
  
  static func monsters(by ingameids: [Int]) -> NSFetchRequest<MonsterModelObject> {
    
    let request = newFetchRequest()
    
    let predicate = NSPredicate(format: "ANY ingameid IN %@", ingameids)
    
    request.predicate = predicate
    
    return request
  }
}
