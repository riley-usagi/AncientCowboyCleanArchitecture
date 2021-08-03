import SwiftUI

/// Статус регистрации пользователя
enum RegistrationStatus: String, CaseIterable {
  case unknown            = "unknown"
  case notRegistered      = "notRegistered"
  case alreadyRegistered  = "alreadyRegistered"
}

/// Точка входа в приложение
@main struct AncientCowboyApp: App {
  
  
  // MARK: - Параметры
  
  /// Текущий статус регистрации пользователя
  @State private var registrationStatus: RegistrationStatus = .notRegistered
  
  /// Объект окружения приложения
  let environment: AppEnvironment
  
  var body: some Scene {
    WindowGroup {
      
      Group {
        
        switch registrationStatus {
        
        case .unknown:
          AnyView(
            Text("Unknown")
          )
          
        case .notRegistered:
          AnyView(
            RegistrationScreen()
              .inject(environment.container)
          )
          
        case .alreadyRegistered:
          AnyView(ContentView(container: environment.container))
        }
      }
      .onAppear {
        print("Trying load hero from FireBase")
      }
    }
  }
  
  
  // MARK: - Инициализаторы
  init() {
    environment = AppEnvironment.bootstrap()
  }
}
