import Combine
import SwiftUI

struct InventoryScreen: View {

  @Environment(\.container) var container: Container

  @State var currentItemsTypeSelected = "Item"

  @State private var items: Loadable<LazyList<InventoryItem>>

  @GestureState var isDragged: Bool = false

  var body: some View {
    content
  }

  init(items: Loadable<LazyList<InventoryItem>> = .notRequested) {
    self._items = .init(initialValue: items)
  }
}

extension InventoryScreen {

  private var content: some View {

    switch items {

    case .notRequested:
      return AnyView(notRequested)
    case .isLoading:
      return AnyView(ActivityIndicatorView())
    case let .loaded(inventoryItems):
      return AnyView(loadedView(inventoryItems))
    case .failed(_):
      return AnyView(Text("Failed"))
    }

  }
}

extension InventoryScreen {
  var notRequested: some View {
    Text("")
      .onAppear {
        UITabBar.appearance().isHidden = true
        container.interactors.inventoryInteractor.loadInventoryItems(items: $items)
      }
  }
}

extension InventoryScreen {
  func loadedView(_ items: LazyList<InventoryItem>) -> some View {

    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

      TabView(selection: $currentItemsTypeSelected) {
        itemListView(allItems: items, itemType: .usable)
          .tag("Item")

        itemListView(allItems: items, itemType: .equip)
          .tag("Equip")

        itemListView(allItems: items, itemType: .cards)
          .tag("Cards")

        itemListView(allItems: items, itemType: .etc)
          .tag("Etc")
      }

      HStack(spacing: 0) {

        InventoryTabBarButton(title: "", image: "flame.fill", currentItemsTypeSelected: $currentItemsTypeSelected)

        Spacer(minLength: 0)

        InventoryTabBarButton(title: "", image: "bolt.fill", currentItemsTypeSelected: $currentItemsTypeSelected)

        Spacer(minLength: 0)

        InventoryTabBarButton(title: "", image: "wallet.pass.fill", currentItemsTypeSelected: $currentItemsTypeSelected)

        Spacer(minLength: 0)

        InventoryTabBarButton(title: "", image: "gear", currentItemsTypeSelected: $currentItemsTypeSelected)
      }
//      .padding(.vertical, 12)
      .padding(.horizontal)
      .background(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
      .clipShape(Capsule())
      .padding(.horizontal, 10)
    }
  }
}