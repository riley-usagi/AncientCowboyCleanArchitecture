import Combine
import SwiftUI

struct RegistrationScreen: View {
  
  @Environment(\.container) var container: Container
  
  @State private var dataPreloaded: Bool = false
  
  var body: some View {
    VStack {
      
      Spacer()
      
      Button(action: {
        container.interactors.itemsInteractor.storeAllItemsFromWeb()
      }, label: {
        Text("Load data")
      })
      
      Spacer()
      
      Button(action: {
        
      }, label: {
        Text("Sign Up")
      })
      .disabled(!dataPreloaded)
      
      Spacer()
    }
    .onReceive(dataPreloadedUpdate) { dataPreloadingStatusAsBool in
      dataPreloaded = dataPreloadingStatusAsBool
    }
  }
}

extension RegistrationScreen {
  private var dataPreloadedUpdate: AnyPublisher<Bool, Never> {
    container.appState.updates(for: \.dataPreloaded)
  }
}
