import SwiftUI

/// Объект локального динамического хранилища (благодаря Store)
struct AppState: Equatable {
  
  ///  Текущий экран (для SideMenu)
  var currentPage: Container.Routes = .fight
  
  /// Статус предзагрузки игровых данных
  var dataPreloaded: Bool {
    get {
      UserDefaults.standard.bool(forKey: "dataPreloaded")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "dataPreloaded")
    }
  }
  
  /// Объект Героя
  var hero: Hero?
}
