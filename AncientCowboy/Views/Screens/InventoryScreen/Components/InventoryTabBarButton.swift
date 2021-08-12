import SwiftUI

struct InventoryTabBarButton: View {
  
  var title: String
  var image: String
  
  @Binding var currentItemsTypeSelected: String
  
  var body: some View {
    Button(action: {
      withAnimation(.spring()) {
        currentItemsTypeSelected = title
      }
    }, label: {
      HStack {
        Image(systemName: image)
          .resizable()
          .renderingMode(.template)
          .frame(width: 20, height: 20)
          .foregroundColor(.white)
        
        if currentItemsTypeSelected == title {
          Text(title)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
      }
      .padding(.vertical, 20)
      .padding(.horizontal)
//      .background(Color.white.opacity(currentItemsTypeSelected == title ? 0.08 : 0))
//      .clipShape(Capsule())
    })
  }
}
