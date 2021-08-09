//
//  InventoryItemModelObject+CoreDataProperties.swift
//  AncientCowboy
//
//  Created by Riley Usagi on 09.08.2021.
//
//

import Foundation
import CoreData


extension InventoryItemModelObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryItemModelObject> {
        return NSFetchRequest<InventoryItemModelObject>(entityName: "InventoryItemModelObject")
    }

    @NSManaged public var id: String?
    @NSManaged public var ingameid: Int32
    @NSManaged public var itemCount: Int32
    @NSManaged public var itemType: Int32
    @NSManaged public var name: String?

}

extension InventoryItemModelObject : Identifiable {

}
