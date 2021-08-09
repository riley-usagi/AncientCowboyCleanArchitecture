import Foundation
import CoreData

@objc(MonsterModelObject) public class MonsterModelObject: NSManagedObject {
  
  static func justOneMonster() -> NSFetchRequest<MonsterModelObject> {
    let request = newFetchRequest()
    request.fetchLimit = 1
    return request
  }
  
  static func monster(by ingameid: Int) -> NSFetchRequest<MonsterModelObject> {
    
    let request = newFetchRequest()
    
    let predicate = NSPredicate(format: "WHERE ingameid IN %@", ingameid)
    
    request.predicate = predicate
    
    return request
  }
}
