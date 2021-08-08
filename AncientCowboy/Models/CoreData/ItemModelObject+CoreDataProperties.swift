import CoreData
import Foundation


extension ItemModelObject {
  
  @NSManaged public var id: String
  @NSManaged public var ingameid: Int32
  @NSManaged public var name: String
  @NSManaged public var itemType: Int32
  @NSManaged public var priceBuy: Int32
  @NSManaged public var priceSell: Int32
  @NSManaged public var weight: Int32
  @NSManaged public var attack: Int32
  @NSManaged public var defence: Int32
  @NSManaged public var slots: Int32
  @NSManaged public var equipJobs: String?
  @NSManaged public var equipUpper: Int32
  @NSManaged public var equipGenders: Int32
  @NSManaged public var equipLocations: Int32
  @NSManaged public var weaponLevel: Int32
  @NSManaged public var equipLevel: Int32
  @NSManaged public var refineable: Int32
  @NSManaged public var view: Int32
  @NSManaged public var script: String?
  @NSManaged public var equipScript: String?
  @NSManaged public var unequipScript: String?
}

extension ItemModelObject: Identifiable {}
extension ItemModelObject: ManagedEntity {}
