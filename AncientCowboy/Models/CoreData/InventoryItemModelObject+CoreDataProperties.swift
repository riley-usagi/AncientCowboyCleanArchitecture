import CoreData
import Foundation

extension InventoryItemModelObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryItemModelObject> {
    return NSFetchRequest<InventoryItemModelObject>(entityName: "InventoryItemModelObject")
  }
  
  @NSManaged public var id: String
  @NSManaged public var name: String
  @NSManaged public var ingameid: Int32
  @NSManaged public var itemCount: Int32
  @NSManaged public var itemType: Int32
}

extension InventoryItemModelObject: Identifiable {}
extension InventoryItemModelObject: ManagedEntity {}
