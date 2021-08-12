extension Container {
  
  /// Роутинг для левого меню
  enum Routes: String, CaseIterable {
    
    /// Экран битвы Героя с Монстрами
    case fight
    
    /// Экран инвентаря Игрока
    case inventory
    
    /// Заголовки (для меню и страницы)
    var title: String {
      switch self {
      
      case .fight:
        return "Fight"
      case .inventory:
        return "Inventory"
      }
    }
    
    /// Иконки для меню
    var icon: String {
      
      switch self {

      case .fight:
        return "flame.fill"
      case .inventory:
        return "shippingbox.fill"
      }
    }
  }
}
