import SwiftUI

extension View {
  
  func inject() -> some View {
    let container = Container()
    
    return inject(container)
  }
  
  func inject(_ container: Container) -> some View {
    return self
      .environment(\.container, container)
  }
}
