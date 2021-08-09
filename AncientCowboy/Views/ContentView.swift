import SwiftUI

struct ContentView: View {
  
  
  // MARK: - Параметры
  
  /// Контейнер с зависимостями
  private let container: Container
  
  var body: some View {
    FightScreen()
      .inject(container)
  }
  
  
  // MARK: - Инициалиазторы
  
  init(container: Container) {
    self.container = container
  }
}
