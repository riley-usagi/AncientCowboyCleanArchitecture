import SwiftUI

struct InventoryCellView: View {
  
  @Environment(\.container) var container: Container
  
  let inventoryItem: InventoryItem
  
  @State private var itemDetails: Loadable<Item>
  
  init(_ inventoryItem: InventoryItem, itemDetails: Loadable<Item> = .notRequested) {
    self.inventoryItem  = inventoryItem
    self._itemDetails   = .init(initialValue: itemDetails)
  }
  
  var body: some View {
    content
  }
}


extension InventoryCellView {
  private var content: some View {
    switch itemDetails {
    
    case .notRequested:
      return AnyView(notRequested)
    case .isLoading:
      return AnyView(ActivityIndicatorView())
    case let .loaded(item):
      return AnyView(loadedView(item))
    case .failed:
      return AnyView(Text("Failed"))
    }
  }
}


extension InventoryCellView {
  private var notRequested: some View {
    Text("")
      .onAppear {
        container.interactors.inventoryInteractor.loadItem(itemDetails: $itemDetails, ingameid: inventoryItem.ingameid)
      }
  }
}


extension InventoryCellView {
  private func loadedView(_ item: Item) -> some View {
    HStack {
      Image(uiImage: item.image)
        .resizable()
        .frame(width: 40, height: 50, alignment: .center)
      
      Text(item.name)
      
      Spacer()
      
      Text(String(inventoryItem.itemCount) + " ea.")
    }
  }
}
