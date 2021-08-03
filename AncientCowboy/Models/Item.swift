import CoreData
import SwiftUI

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
    case name           = "name_japanese"
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
    case equipGenders   = "equip_genders"
    case equipLocations = "equip_locations"
    case weaponLevel    = "weapon_level"
    case equipLevel     = "equip_level"
    case refineable     = "refineable"
    case view = "view"
    case script = "script"
    case equipScript = "equip_script"
    case unequipScript = "unequip_script"
  }

}
