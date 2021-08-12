
import SwiftUI

extension InventoryScreen {
  
  func itemListView(allItems: LazyList<InventoryItem>, itemType: ItemType) -> some View {
    
    let sortedItems = allItems.filter { inventoryItem in
      itemType.itemTypeInteger.contains(inventoryItem.itemType)
    }
    
    return List {
      
      ForEach(sortedItems) { item in
        List {
          HStack {
            Text(String(item.ingameid))
            Spacer()
            Text(String(item.itemCount))
          }
        }
      }
      .onDelete { indexSet in
        container.interactors.inventoryInteractor.soldItem(
          ingameid: sortedItems[indexSet[indexSet.startIndex]].ingameid
        )
      }
    }
  }
}


extension InventoryScreen {
  
  // MARK: - Item types helper
  //Type:
  //  0  Healing item.
  //  2  Usable item.
  //  3  Etc item
  //  4  Weapon
  //  5  Armor/Garment/Boots/Headgear
  //  6  Card
  //  7  Pet egg
  //  8  Pet equipment
  //  10  Ammo (Arrows/Bullets/etc)
  //  11  Usable with delayed consumption (item is lost from inventory
  //    after selecting a target, for use with skills and pet lures)
  //  18  Another delayed consume that requires user confirmation before
  //    using item.
  
  enum ItemType {
    case usable
    case equip
    case cards
    case etc
    
    var itemTypeInteger: [Int] {
      switch self {
      
      case .usable:
        return [0, 2]
      case .equip:
        return [4, 5]
      case .cards:
        return [6]
      case .etc:
        return [3, 7, 8, 10, 11, 18]
      }
    }
  }
}
