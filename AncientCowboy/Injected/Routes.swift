extension Container {
  
  enum Routes: String, CaseIterable {
    case fight
    case inventory
    
    var title: String {
      switch self {
      
      case .fight:
        return "Fight"
      case .inventory:
        return "Inventory"
      }
    }
    
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
