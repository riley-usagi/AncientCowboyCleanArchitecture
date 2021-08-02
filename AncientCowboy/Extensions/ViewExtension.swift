import SwiftUI

extension View {
  
  func inject(_ interactors: Container.Interactors) -> some View {
    let container = Container(interactors: interactors)
    
    return inject(container)
  }
  
  func inject(_ container: Container) -> some View {
    return self
      .environment(\.container, container)
  }
}
