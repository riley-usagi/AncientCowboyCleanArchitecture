import SwiftUI

struct SideMenu: View {
  
  @Environment(\.container) var container: Container
  
  var body: some View {
    
    VStack {
      
      // MARK: - Buttons
      VStack {
        
        ForEach(Container.Routes.allCases, id: \.self) { menuOption in
          TabButton(image: menuOption.icon, menuOption: menuOption)
        }
      }
      .frame(height: getRect().height / 2.3)
      .padding(.top)
      
      Spacer(minLength: getRect().height < 750 ? 30 : 50)
      
    }
    .frame(width: 70)
    .background(
      LinearGradient(
        gradient: Gradient(
          colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]
        ),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()
    )
    .padding(.trailing, 0)
    .zIndex(1)
  }
}



// MARK: - TabButton struct
struct TabButton: View {
  
  @Environment(\.container) var container: Container
  
  var image: String
  
  var menuOption: Container.Routes
  
  var body: some View {
    Button(action: {
      
      DispatchQueue.main.async {
        container.appState.value.currentPage = menuOption
      }
      
    }, label: {
      Image(systemName: image)
        .font(.title)
        .foregroundColor(.white)
        //        .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6))
        .frame(maxHeight: .infinity)
    })
  }
}


// MARK: - Extensions
extension SideMenu {
  func getRect() -> CGRect {
    UIScreen.main.bounds
  }
  
  func getSafeArea() -> UIEdgeInsets {
    UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
