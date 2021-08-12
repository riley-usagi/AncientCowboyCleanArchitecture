import SwiftUI

struct AppState: Equatable {
  
  var currentPage: Container.Routes = .fight
  
  var dataPreloaded: Bool {
    get {
      UserDefaults.standard.bool(forKey: "dataPreloaded")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "dataPreloaded")
    }
  }
  
  var hero: Hero?
}
