import SwiftUI

struct ContentView: View {
  
  
  // MARK: - Параметры
  
  /// Контейнер с зависимостями
  private let container: Container
  
  var body: some View {
    Text("Hello, world!")
      .onAppear {
        container.interactors.itemsInteractor.storeAllItemsFromWeb()
      }
  }
  
  
  // MARK: - Инициалиазторы
  init(container: Container) {
    self.container = container
  }
}
