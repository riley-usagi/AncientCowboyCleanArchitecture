import Firebase
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
  @State private var registrationStatus: RegistrationStatus = .unknown
  
  /// Объект окружения приложения
  let environment: AppEnvironment
  
  var body: some Scene {
    WindowGroup {
      
      // Группа, определяющая экран, в зависимости от статуса регистрации
      Group {
        
        switch registrationStatus {
        
        case .unknown:
          AnyView(ActivityIndicatorView())
          
        case .notRegistered:
          AnyView(
            RegistrationScreen(registrationStatus: $registrationStatus)
              .inject(environment.container)
          )
          
        case .alreadyRegistered:
          AnyView(ContentView(container: environment.container))
        }
      }
      
      // Проверяется статус регистрации
      .onAppear {
        environment.container.interactors.heroesInteractor.loadHeroFromFireStore { loadingHeroResultAsBool in
          
          switch loadingHeroResultAsBool {
          
          case .success:
            registrationStatus = .alreadyRegistered
          case .failure:
            registrationStatus = .notRegistered
          }
        }
      }
    }
  }
  
  
  // MARK: - Инициализаторы
  
  init() {
    
    // Первоначальная настройка FireBase
    FirebaseApp.configure()
    
    // Заполняем параметр environment
    // настроенным объектом Окружения с контейнером
    environment = AppEnvironment.bootstrap()
  }
}
