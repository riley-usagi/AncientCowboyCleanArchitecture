import CoreData
import SwiftUI

///// Модель Монстра
struct Monster: Identifiable, Equatable, Codable {
  
  
  // MARK: - Параметры
  
  var id: String = UUID().uuidString
  var atk1: Int
  var hp: Int
  var ingameid: Int
  var level: Int
  var name: String
  var atk2: Int
  var def: Int
  var mdef: Int
  var sp: Int
  var exp: Int
  var jexp: Int
  var mexp: Int
  var str: Int
  var agi: Int
  var vit: Int
  var intellect: Int
  var dex: Int
  var luk: Int
  var scale: Int
  var race: Int
  var element: Int
  var mode: Int
  var drop1id: Int
  var drop2id: Int
  var drop3id: Int
  var drop4id: Int
  var drop5id: Int
  var drop6id: Int
  var drop7id: Int
  var drop8id: Int
  var drop9id: Int
  var dropCardId: Int
  var drop1per: Int
  var drop2per: Int
  var drop3per: Int
  var drop4per: Int
  var drop5per: Int
  var drop6per: Int
  var drop7per: Int
  var drop8per: Int
  var drop9per: Int
  var dropCardPer: Int
  
  var image: UIImage = UIImage(systemName: "leaf.fill")!
  
  static let monstersByLocation: [String: [Int]] = [
    "prt_fild08": [1063, 1002, 1113, 1007]
  ]
  
  enum CodingKeys: String, CodingKey {
    case hp = "HP"
    case ingameid = "ID"
    case level = "LV"
    case name = "iName"
    case atk1 = "ATK1"
    case atk2 = "ATK2"
    case def = "DEF"
    case mdef = "MDEF"
    case sp = "SP"
    case exp = "EXP"
    case jexp = "JEXP"
    case mexp = "MEXP"
    case str = "STR"
    case agi = "AGI"
    case vit = "VIT"
    case intellect = "INT"
    case dex = "DEX"
    case luk = "LUK"
    case scale = "Scale"
    case race = "Race"
    case element = "Element"
    case mode = "Mode"
    case drop1id = "Drop1id"
    case drop2id = "Drop2id"
    case drop3id = "Drop3id"
    case drop4id = "Drop4id"
    case drop5id = "Drop5id"
    case drop6id = "Drop6id"
    case drop7id = "Drop7id"
    case drop8id = "Drop8id"
    case drop9id = "Drop9id"
    case dropCardId = "DropCardid"
    case drop1per = "Drop1per"
    case drop2per = "Drop2per"
    case drop3per = "Drop3per"
    case drop4per = "Drop4per"
    case drop5per = "Drop5per"
    case drop6per = "Drop6per"
    case drop7per = "Drop7per"
    case drop8per = "Drop8per"
    case drop9per = "Drop9per"
    case dropCardPer = "DropCardper"
  }
}

extension Monster {
  init?(managedObject: MonsterModelObject) {
    self.init(
      atk1: Int(managedObject.atk1),
      hp: Int(managedObject.hp),
      ingameid: Int(managedObject.ingameid),
      level: Int(managedObject.level),
      name: managedObject.name,
      atk2: Int(managedObject.atk2),
      def: Int(managedObject.def),
      mdef: Int(managedObject.mdef),
      sp: Int(managedObject.sp),
      exp: Int(managedObject.exp),
      jexp: Int(managedObject.jexp),
      mexp: Int(managedObject.mexp),
      str: Int(managedObject.str),
      agi: Int(managedObject.agi),
      vit: Int(managedObject.vit),
      intellect: Int(managedObject.intellect),
      dex: Int(managedObject.dex),
      luk: Int(managedObject.luk),
      scale: Int(managedObject.scale),
      race: Int(managedObject.race),
      element: Int(managedObject.element),
      mode: Int(managedObject.mode),
      drop1id: Int(managedObject.drop1id),
      drop2id: Int(managedObject.drop2id),
      drop3id: Int(managedObject.drop3id),
      drop4id: Int(managedObject.drop4id),
      drop5id: Int(managedObject.drop5id),
      drop6id: Int(managedObject.drop6id),
      drop7id: Int(managedObject.drop7id),
      drop8id: Int(managedObject.drop8id),
      drop9id: Int(managedObject.drop9id),
      dropCardId: Int(managedObject.dropCardId),
      drop1per: Int(managedObject.drop1per),
      drop2per: Int(managedObject.drop2per),
      drop3per: Int(managedObject.drop3per),
      drop4per: Int(managedObject.drop4per),
      drop5per: Int(managedObject.drop5per),
      drop6per: Int(managedObject.drop6per),
      drop7per: Int(managedObject.drop7per),
      drop8per: Int(managedObject.drop8per),
      drop9per: Int(managedObject.drop9per),
      dropCardPer: Int(managedObject.dropCardPer)
    )
  }
}


extension Monster {
  @discardableResult func store(in context: NSManagedObjectContext) -> MonsterModelObject? {
    guard let details = MonsterModelObject.insertNew(in: context) else { return nil }
    
    
    details.atk1 = Int32(atk1)
    details.atk2 = Int32(atk2)
    details.hp = Int32(hp)
    details.ingameid = Int32(ingameid)
    details.level = Int32(level)
    details.name = name
    details.def = Int32(def)
    details.mdef = Int32(mdef)
    details.sp = Int32(sp)
    details.exp = Int32(exp)
    details.jexp = Int32(jexp)
    details.mexp = Int32(mexp)
    details.str = Int32(str)
    details.agi = Int32(agi)
    details.vit = Int32(vit)
    details.intellect = Int32(intellect)
    details.dex = Int32(def)
    details.luk = Int32(luk)
    details.scale = Int32(scale)
    details.race = Int32(race)
    details.element = Int32(element)
    details.mode = Int32(mode)
    details.drop1id = Int32(drop1id)
    details.drop2id = Int32(drop2id)
    details.drop3id = Int32(drop3id)
    details.drop4id = Int32(drop4id)
    details.drop5id = Int32(drop5id)
    details.drop6id = Int32(drop6id)
    details.drop7id = Int32(drop7id)
    details.drop8id = Int32(drop8id)
    details.drop9id = Int32(drop9id)
    details.dropCardId = Int32(dropCardId)
    details.drop1per = Int32(drop1per)
    details.drop2per = Int32(drop2per)
    details.drop3per = Int32(drop3per)
    details.drop4per = Int32(drop4per)
    details.drop5per = Int32(drop5per)
    details.drop6per = Int32(drop6per)
    details.drop7per = Int32(drop7per)
    details.drop8per = Int32(drop8per)
    details.drop9per = Int32(drop9per)
    details.dropCardPer = Int32(dropCardPer)
    
    return details
  }
}

///// Монстр заглушка
let stubMonster: Monster = Monster(atk1: 7, hp: 7, ingameid: 7, level: 7, name: "Stub Monster", atk2: 7, def: 7, mdef: 7, sp: 7, exp: 7, jexp: 7, mexp: 7, str: 7, agi: 7, vit: 7, intellect: 7, dex: 7, luk: 7, scale: 7, race: 7, element: 7, mode: 7, drop1id: 7, drop2id: 7, drop3id: 7, drop4id: 7, drop5id: 7, drop6id: 7, drop7id: 7, drop8id: 7, drop9id: 7, dropCardId: 7, drop1per: 7, drop2per: 7, drop3per: 7, drop4per: 7, drop5per: 7, drop6per: 7, drop7per: 7, drop8per: 7, drop9per: 7, dropCardPer: 7)
