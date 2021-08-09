import SwiftUI

extension RegistrationScreen {
  
  func statsView() -> some View {
    
    VStack {
      
      HStack {
        Text("Stat points: " + String(statPoints))
          .fontWeight(.bold)
          .foregroundColor(.gray)
      }
      .padding(.bottom, 5)
      
      
      // MARK: - STR
      HStack {
        Spacer()
        
        Button(action: {
          if stats["STR"]! >= 2 {
            stats["STR"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("STR: \(stats["STR"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["STR"]! <= 8 {
            stats["STR"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
      
      
      // MARK: - AGI
      HStack {
        Spacer()
        
        Button(action: {
          if stats["AGI"]! >= 2 {
            stats["AGI"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("AGI: \(stats["AGI"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["AGI"]! <= 8 {
            stats["AGI"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
      
      
      // MARK: - VIT
      HStack {
        Spacer()
        
        Button(action: {
          if stats["VIT"]! >= 2 {
            stats["VIT"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("VIT: \(stats["VIT"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["VIT"]! <= 8 {
            stats["VIT"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
      
      
      // MARK: - INT
      HStack {
        Spacer()
        
        Button(action: {
          if stats["INT"]! >= 2 {
            stats["INT"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("INT: \(stats["INT"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["INT"]! <= 8 {
            stats["INT"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
      
      
      // MARK: - DEX
      HStack {
        Spacer()
        
        Button(action: {
          if stats["DEX"]! >= 2 {
            stats["DEX"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("DEX: \(stats["DEX"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["DEX"]! <= 8 {
            stats["DEX"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
      
      
      // MARK: - LUK
      HStack {
        Spacer()
        
        Button(action: {
          if stats["LUK"]! >= 2 {
            stats["LUK"]! -= 1
            statPoints += 1
          }
        }, label: {
          Image(systemName: "arrow.left")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
        
        Text("LUK: \(stats["LUK"]!)")
          .fontWeight(.heavy)
          .foregroundColor(.gray)
        
        Spacer()
        
        Button(action: {
          if statPoints > 0 && stats["LUK"]! <= 8 {
            stats["LUK"]! += 1
            statPoints -= 1
          }
        }, label: {
          Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 14, height: 14)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.gray)
            .padding(.all)
            .background(Color(#colorLiteral(red: 0.8145515742, green: 0.8625463843, blue: 0.9059594274, alpha: 1)))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
        })
        
        Spacer()
      }
      .padding(.all, 2)
    }
  }
}
