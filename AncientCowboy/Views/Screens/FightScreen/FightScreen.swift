import Combine
import SwiftUI

struct FightScreen: View {
  
  @Environment(\.container) var container: Container
  
  @State private var enemy: Loadable<Monster>
  
  @State var heroAttackTimer = Timer.publish(every: 0.5, on: .main, in: .common)
  
  init(enemy: Loadable<Monster> = .notRequested) {
    self._enemy = .init(initialValue: enemy)
  }
  
  var body: some View {
    content
  }
}


extension FightScreen {
  
  private var content: some View {
    
    switch enemy {
    
    case .notRequested:
      return AnyView(notRequestedView)
    case .isLoading:
      return AnyView(ActivityIndicatorView())
    case let .loaded(enemy):
      return AnyView(loadedView(enemy))
    case .failed:
      return AnyView(Text(""))
    }
  }
}


// MARK: - Not requested

extension FightScreen {
  private var notRequestedView: some View {
    Text("")
      .onAppear {
        container.interactors.monstersInteractor.reloadEnemy($enemy)
      }
  }
}


extension FightScreen {
  private func loadedView(_ enemy: Monster) -> some View {
    VStack {
      
      Image(uiImage: enemy.image)
      
      Text("\(enemy.name)")
        .font(.largeTitle)
      
      Text("\(String(describing: enemy.hp))")
        .font(.title)
    }
    .onAppear {
      _ = self.heroAttackTimer.connect()
    }
    .onReceive(heroAttackTimer) { value in
      
      if enemy.hp > 0 {
        container.interactors.monstersInteractor.updateEnemy(monster: enemy, enemy: $enemy)
      } else {
        
        self.heroAttackTimer.connect().cancel()
        
        container.interactors.monstersInteractor.reloadEnemy($enemy)
        
        self.heroAttackTimer = Timer.publish(every: 0.5, on: .main, in: .common)
        
        _ = self.heroAttackTimer.connect()
        
      }
      
    }
  }
}
