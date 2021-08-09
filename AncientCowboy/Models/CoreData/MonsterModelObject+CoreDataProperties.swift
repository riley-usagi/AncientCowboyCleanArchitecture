import CoreData
import Foundation

extension MonsterModelObject {
  
  @NSManaged public var atk1: Int32
  @NSManaged public var hp: Int32
  @NSManaged public var id: String
  @NSManaged public var ingameid: Int32
  @NSManaged public var level: Int32
  @NSManaged public var name: String
  @NSManaged public var atk2: Int32
  @NSManaged public var def: Int32
  @NSManaged public var mdef: Int32
  @NSManaged public var sp: Int32
  @NSManaged public var exp: Int32
  @NSManaged public var jexp: Int32
  @NSManaged public var mexp: Int32
  @NSManaged public var str: Int32
  @NSManaged public var agi: Int32
  @NSManaged public var vit: Int32
  @NSManaged public var intellect: Int32
  @NSManaged public var dex: Int32
  @NSManaged public var luk: Int32
  @NSManaged public var scale: Int32
  @NSManaged public var race: Int32
  @NSManaged public var element: Int32
  @NSManaged public var mode: Int32
  @NSManaged public var drop1id: Int32
  @NSManaged public var drop2id: Int32
  @NSManaged public var drop3id: Int32
  @NSManaged public var drop4id: Int32
  @NSManaged public var drop5id: Int32
  @NSManaged public var drop6id: Int32
  @NSManaged public var drop7id: Int32
  @NSManaged public var drop8id: Int32
  @NSManaged public var drop9id: Int32
  @NSManaged public var dropCardId: Int32
  @NSManaged public var drop1per: Int32
  @NSManaged public var drop2per: Int32
  @NSManaged public var drop3per: Int32
  @NSManaged public var drop4per: Int32
  @NSManaged public var drop5per: Int32
  @NSManaged public var drop6per: Int32
  @NSManaged public var drop7per: Int32
  @NSManaged public var drop8per: Int32
  @NSManaged public var drop9per: Int32
  @NSManaged public var dropCardPer: Int32
  
}

extension MonsterModelObject: Identifiable {}
extension MonsterModelObject: ManagedEntity {}
