import SwiftUI

struct ItemScreen: View {
  
  let item: Item
  
  init(_ item: Item) {
    self.item = item
  }
  
  var body: some View {
    VStack {
      Spacer()
      
      Image(uiImage: item.image)
      
      Text(item.name)
        .font(.largeTitle)
      
      List {
        
        // MARK: - Type
        HStack {
          Text("Type: ")
            .font(.headline)
          
          Spacer()
          
          Text(ItemType.rawvalueByIntegerType(itemTypeInteger: item.itemType).capitalized)
            .fontWeight(.medium)
        }
        
        
        // MARK: - Sell price
        HStack {
          Text("Sell price: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.priceBuy ?? 0) + " zeny")
        }
        
        
        // MARK: - Weight
        HStack {
          Text("Weight: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.weight))
        }
        
        
        // MARK: - Attack
        HStack {
          Text("Attack: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.attack ?? 0))
        }
        
        
        // MARK: - Defence
        HStack {
          Text("Defence: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.defence ?? 0))
        }
        
        
        // MARK: - Equip level
        HStack {
          Text("Equip level: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.equipLevel ?? 1))
        }
        
        
        // MARK: - Refineable
        HStack {
          Text("Refineable: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.refineable == 1 ? "Yes" : "No"))
        }
        
        
        // MARK: - Slots
        HStack {
          Text("Slots: ")
            .font(.headline)
          
          Spacer()
          
          Text(String(item.slots ?? 0))
        }
        
        
        // MARK: - Script
        HStack(spacing: 10) {
          Text("Script: ")
            .font(.headline)
          
          Spacer()
          
          Text(item.script ?? "None")
            .multilineTextAlignment(.leading)
        }
      }
      .padding([.leading, .trailing], 50)
      
      Button(action: {
        print(item.priceBuy ?? 0)
      }, label: {
        Text("Sell")
      })
      
      Spacer()
    }
  }
}
