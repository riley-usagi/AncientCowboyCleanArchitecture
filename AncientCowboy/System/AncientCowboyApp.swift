import SwiftUI

@main struct AncientCowboyApp: App {
  
  // MARK: - Параметры
  
  /// Объект окружения приложения
  let environment: AppEnvironment
  
  var body: some Scene {
    WindowGroup {
      ContentView(container: environment.container)
    }
  }
  
  
  // MARK: - Инициализаторы
  init() {
    environment = AppEnvironment.bootstrap()
  }
}
