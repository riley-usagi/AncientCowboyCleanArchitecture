import SwiftUI

/// Контейнер с зависимостями приложения
struct Container: EnvironmentKey {
  
  
  // MARK: - Технические параметры
  
  static var defaultValue: Self { Self.default }
  
  private static let `default` = Self(interactors: .stub)
  
  
  // MARK: - Параметры
  let interactors: Interactors
  
  // MARK: - Инициализаторы
  init(interactors: Interactors) {
    self.interactors = interactors
  }
}


extension EnvironmentValues {
  
  var container: Container {
    get { self[Container.self] }
    set { self[Container.self] = newValue }
  }
}
