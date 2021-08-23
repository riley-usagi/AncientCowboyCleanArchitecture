import Combine
import SwiftUI

struct ContentView: View {
  
  
  // MARK: - Параметры
  
  /// Контейнер с зависимостями
  private let container: Container
  
  /// Текущая страница
  @State var currentPage: Container.Routes = .fight
  
  var body: some View {
    
    HStack(spacing: 0) {
      
      // Боковое меню (слева)
      SideMenu()
      
      // Текущая страница
      Group {
        switch currentPage {
        case .fight:
          FightScreen()
        case .inventory:
          InventoryScreen()
        }
      }
      .frame(maxWidth: .infinity)
    }
    
    .ignoresSafeArea(.all)

    .inject(container)
    
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
  
  /// Подписка под обновление статуса текущей страницы
  var currentPageUpdate: AnyPublisher<Container.Routes, Never> {
    container.appState.updates(for: \.currentPage)
  }
}
