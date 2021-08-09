import SwiftUI

extension View {
  
  func inject(_ appState: AppState, _ interactors: Container.Interactors) -> some View {
    let container = Container(appState: .init(appState), interactors: interactors)
    
    return inject(container)
  }
  
  
  /// Добавление главного контейнера в иерархию Экранов
  /// - Parameter container: Объект настроенного контейнера
  /// - Returns: Объект View
  func inject(_ container: Container) -> some View {
    return self
      .environment(\.container, container)
  }
}

extension View {
  func placeholder<Content: View>(
    when shouldShow: Bool,
    alignment: Alignment = .leading,
    @ViewBuilder placeholder: () -> Content) -> some View {
    
    ZStack(alignment: alignment) {
      placeholder().opacity(shouldShow ? 1 : 0)
      self
    }
  }
}
