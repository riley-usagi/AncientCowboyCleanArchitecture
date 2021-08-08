import Combine
import SwiftUI

struct RegistrationScreen: View {
  
  @Environment(\.container) var container: Container
  
  @State private var dataPreloaded: Bool = false
  
  let cancelBag = CancelBag()
  
  var body: some View {
    VStack {
      
      Spacer()
      
      Button(action: {

      }, label: {
        Text("Sign Up")
      })
      .disabled(!dataPreloaded)
      
      Spacer()
    }
    .onAppear {
      if !dataPreloaded {
        container.interactors.itemsInteractor.storeAllItemsFromWeb()
      }
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
