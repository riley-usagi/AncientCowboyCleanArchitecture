import Combine
import SwiftUI

struct RegistrationScreen: View {
  
  @Environment(\.container) var container: Container
  
  @Binding var registrationStatus: RegistrationStatus
  
  @State private var dataPreloaded: Bool = false
  
  @State var gender = "male"
  
  @State var name = ""
  
  @State var stats: [String: Int] = [
    "STR": 1, "AGI": 1, "VIT": 1, "INT": 1, "DEX": 1, "LUK": 1
  ]
  
  @State var statPoints: Int = 24
  
  var body: some View {
    VStack {
      
      ZStack {
        
        HStack {
          Button(action: {
            withAnimation {
              gender = "male"
            }
          }, label: {
            Image("male_icon")
              .resizable()
              .frame(width: 20, height: 20)
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(.gray)
              .padding(.all)
              .background(Color(#colorLiteral(red: 0.8205515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
              .clipShape(Circle())
              .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
              .shadow(color: Color.white, radius: 10, x: -10, y: -10)
          })
          
          Spacer()
          
          Button(action: {
            withAnimation {
              gender = "female"
            }
          }, label: {
            Image("female_icon")
              .resizable()
              .frame(width: 20, height: 20)
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(.gray)
              .padding(.all)
              .background(Color(#colorLiteral(red: 0.8205515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
              .clipShape(Circle())
              .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
              .shadow(color: Color.white, radius: 10, x: -10, y: -10)
          })
        }
        
        Text(gender.capitalized)
          .fontWeight(.bold)
          .foregroundColor(.gray)
        
      }
      
      Image(gender)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: UIScreen.main.bounds.size.width * 0.4)
        .padding(.horizontal, 25)
        .clipShape(Circle())
        .padding(.all, 8)
        .background(Color(#colorLiteral(red: 0.8205515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)).opacity(0.6))
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
        .shadow(color: Color.white, radius: 10, x: -10, y: -10)
      
      
      HStack {
        Spacer()
        
        TextField("", text: $name)
          .placeholder(when: name.isEmpty, alignment: .center) {
            Text("Enter character name")
              .foregroundColor(.gray)
          }
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.top, 25)
        
        Spacer()
      }
      .padding()
      
      statsView()
      
      Button(
        action: {
          if dataPreloaded {
            container.interactors.heroesInteractor.createHero(
              Hero(
                name: name,
                str: stats["STR"]!, agi: stats["AGI"]!, vit: stats["VIT"]!,
                int: stats["INT"]!, dex: stats["DEX"]!, luk: stats["LUK"]!
              )
            ) { heroCreatingResultAsBool in
              switch heroCreatingResultAsBool {
              
              case .success(_):
                registrationStatus = .alreadyRegistered
              case let .failure(error):
                print("Registration error: \(String(describing: error))")
              }
            }
          }
        }, label: {
          if !dataPreloaded {
            HStack(spacing: 15) {
              Text("Data is loading")
                .fontWeight(.bold)
                .font(.system(size: 20))
              
              ActivityIndicatorView()
            }
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.size.width - 100)
            .background(
              LinearGradient(
                gradient: Gradient(
                  colors: [Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
            .cornerRadius(8)
            
          } else {
            Text("Create")
              .font(.system(size: 20))
              .foregroundColor(.gray)
              .fontWeight(.bold)
              .padding(.vertical)
              .frame(width: UIScreen.main.bounds.size.width - 100)
              .background(
                LinearGradient(
                  gradient: Gradient(
                    colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
                  ),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .cornerRadius(8)
          }
        }
      )
      .padding(.top, 10)
      .padding()
      .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
      .shadow(color: Color.white, radius: 10, x: -10, y: -10)
      .disabled(!dataPreloaded)
      
      Spacer()
    }
    .padding()
    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).edgesIgnoringSafeArea(.all))
    
    .onAppear {
      if !dataPreloaded {
        container.interactors.monstersInteractor.storeAllMonstersFromWeb()
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
