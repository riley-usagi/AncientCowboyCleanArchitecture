import Combine
import SwiftUI

struct InventoryScreen: View {
  
  /// Контейнер с зависимостями
  @Environment(\.container) var container: Container
  
  /// Текущий выбранный тип предмета в TabView
  @State var currentItemsTypeSelected = "Item"
  
  /// Загружаемый объект - список вещей из Инвентаря
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
  
  /// Основной контент экрана в зависимости от статуса загружаемого объекта
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
  
  /// Экран не загружен
  var notRequested: some View {
    Text("")
      .onAppear {
        container.interactors.inventoryInteractor.loadInventoryItems(items: $items)
      }
  }
}

extension InventoryScreen {
  
  /// Экран загружен
  /// - Parameter items: Список предметов инвентаря
  /// - Returns: Экран с загруженными данными
  func loadedView(_ items: LazyList<InventoryItem>) -> some View {
    TabView {
      InventoryListView(items: items, itemType: .usable)
        .tabItem {
          Text("Usable")
            .tag(1)
        }
      
      InventoryListView(items: items, itemType: .equip)
        .tabItem {
          Text("Equip")
            .tag(2)
        }
      
      InventoryListView(items: items, itemType: .cards)
        .tabItem {
          Text("Cards")
            .tag(3)
        }
      
      InventoryListView(items: items, itemType: .etc)
        .tabItem {
          Text("Etc")
            .tag(4)
        }
    }
    .ignoresSafeArea()
  }
}
