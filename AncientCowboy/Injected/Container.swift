import SwiftUI

/// Контейнер с зависимостями приложения
struct Container: EnvironmentKey {
  
  
  // MARK: - Технические параметры
  
  static var defaultValue: Self { Self.default }
  
  private static let `default` = Self()
  
  
  // MARK: - Параметры
  
  
  // MARK: - Инициализаторы
}


extension EnvironmentValues {
  
  var container: Container {
    get { self[Container.self] }
    set { self[Container.self] = newValue }
  }
}
