import SwiftUI

struct InventoryListView: View {
  
  var items: LazyList<InventoryItem>
    
  let itemType: ItemType

  var sortedItems: [InventoryItem] {
    get {
      items.filter { inventoryItem in
        itemType.itemTypeInteger.contains(inventoryItem.itemType)
      }
    }
  }
  
  var body: some View {
    List(sortedItems) { item in
      InventoryCellView(item)
    }
  }
}
