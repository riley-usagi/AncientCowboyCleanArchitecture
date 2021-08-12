import CoreData
import SwiftUI

/// Модель игрового Предмета
struct Item: Identifiable, Equatable, Codable {
  
  var id: String = UUID().uuidString
  var name: String
  var ingameid: Int
  var itemType: Int
  var priceBuy: Int?
  var priceSell: Int?
  var weight: Int
  var attack: Int?
  var defence: Int?
  var slots: Int?
  var equipJobs: String?
  var equipUpper: Int?
  var equipGenders: Int?
  var equipLocations: Int?
  var weaponLevel: Int?
  var equipLevel: Int?
  var refineable: Int?
  var view: Int?
  var script: String?
  var equipScript: String?
  var unequipScript: String?
  
  var image: UIImage?
  
  enum CodingKeys: String, CodingKey {
    case name = "name_japanese"
    case ingameid = "id"
    case itemType = "type"
    case priceBuy = "price_buy"
    case priceSell = "price_sell"
    case weight = "weight"
    case attack = "attack"
    case defence = "defence"
    case slots = "slots"
    case equipJobs = "equip_jobs"
    case equipUpper = "equip_upper"
    case equipGenders = "equip_genders"
    case equipLocations = "equip_locations"
    case weaponLevel = "weapon_level"
    case equipLevel = "equip_level"
    case refineable = "refineable"
    case view = "view"
    case script = "script"
    case equipScript = "equip_script"
    case unequipScript = "unequip_script"
  }
}

extension Item {
  
  init?(managedObject: ItemModelObject) {
    
    self.init(
      name: managedObject.name,
      ingameid: Int(managedObject.ingameid),
      itemType: Int(managedObject.itemType),
      priceBuy: managedObject.priceBuy == 0 ? nil : Int(managedObject.priceBuy),
      priceSell: Int(managedObject.priceSell),
      weight: Int(managedObject.weight),
      attack: Int(managedObject.attack),
      defence: Int(managedObject.defence),
      slots: Int(managedObject.slots),
      equipJobs: managedObject.equipJobs,
      equipUpper: Int(managedObject.equipUpper),
      equipGenders: Int(managedObject.equipGenders),
      equipLocations: Int(managedObject.equipLocations),
      weaponLevel: Int(managedObject.weaponLevel),
      equipLevel: Int(managedObject.equipLevel),
      refineable: Int(managedObject.refineable),
      view: Int(managedObject.view),
      script: managedObject.script,
      equipScript: managedObject.equipScript,
      unequipScript: managedObject.unequipScript
    )
  }
}

extension Item {
  
  #warning("Попробовать преобразовать в Result")
  
  /// Часть процесса сохранения игрового предмета в CoreData
  /// - Parameter context: Объект Контекста
  /// - Returns: Необязательный объект из Базы данных
  @discardableResult func store(in context: NSManagedObjectContext) -> ItemModelObject? {
    guard let details = ItemModelObject.insertNew(in: context) else { return nil }
    
    details.name = name
    details.ingameid = Int32(ingameid)
    details.itemType = Int32(itemType)
    details.priceBuy = Int32(priceBuy ?? 0)
    details.priceSell = Int32(priceSell ?? 0)
    details.weight = Int32(weight)
    details.attack = Int32(attack ?? 0)
    details.defence = Int32(defence ?? 0)
    details.slots = Int32(slots ?? 0)
    details.equipJobs = equipJobs ?? nil
    details.equipUpper = Int32(equipUpper ?? 0)
    details.equipGenders = Int32(equipGenders ?? 0)
    details.equipLocations = Int32(equipLocations ?? 0)
    details.weaponLevel = Int32(weaponLevel ?? 0)
    details.equipLevel = Int32(equipLevel ?? 0)
    details.refineable = Int32(refineable ?? 0)
    details.view = Int32(view ?? 0)
    details.script = script
    details.equipScript = equipScript
    details.unequipScript = unequipScript
    
    return details
  }
}
