import SwiftUI

struct ContentView: View {
  
  
  // MARK: - Параметры
  
  /// Контейнер с зависимостями
  private let container: Container
  
  var body: some View {
    VStack {
      Text("Hero name:" + container.appState.value.hero!.name)
        .font(.largeTitle)
        .padding()
      Text("Fight Screen will be here")
    }
  }
  
  
  // MARK: - Инициалиазторы
  
  init(container: Container) {
    self.container = container
  }
}
