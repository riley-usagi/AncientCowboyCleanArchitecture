import Combine
import SwiftUI

struct ContentView: View {
  
  
  // MARK: - Параметры
  
  /// Контейнер с зависимостями
  private let container: Container
  
  @State var currentPage: Container.Routes = .fight
  
  var body: some View {
    
    HStack(spacing: 0) {
      
      SideMenu()
      
      Group {
        switch currentPage {
        case .fight:
          FightScreen()
        case .inventory:
          InventoryScreen()
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
    }
    .inject(container)
    .ignoresSafeArea(.all)
    .onReceive(currentPageUpdate) { page in
      currentPage = page
    }
  }
  
  // MARK: - Инициалиазторы
  
  init(container: Container) {
    self.container = container
  }
}

extension ContentView {
  
  var currentPageUpdate: AnyPublisher<Container.Routes, Never> {
    container.appState.updates(for: \.currentPage)
  }
}
