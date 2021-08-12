import Combine
import SwiftUI

protocol InventoryInteractor {
  func collectLootedItems(from monster: Monster)
  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>)
  func soldItem(ingameid: Int)
}

struct RealInventoryInteractor: InventoryInteractor {

  let inventoryDBService: InventoryDBService

  let itemsDBService: ItemsDBService

  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>) {

    let cancelBag = CancelBag()

    items.wrappedValue.setIsLoading(cancelBag: cancelBag)

    Just<Void>
      .withErrorType(Void(), Error.self)
      .flatMap { [inventoryDBService] _ -> AnyPublisher<LazyList<InventoryItem>, Error> in
        inventoryDBService.loadInventoryItems()
      }
      .sinkToLoadable { inventoryItemsList in
        items.wrappedValue = inventoryItemsList
      }
      .store(in: cancelBag)
  }

  func collectLootedItems(from monster: Monster) {

    let cancelBag = CancelBag()

    for itemID in dropCalculating(by: monster) {

      itemsDBService
        .item(ingameid: itemID)
        .sinkToResult { result in
          switch result {
          case let .success(item):
            inventoryDBService.saveItemToInventory(by: itemID, itemType: item!.itemType)
          case let .failure(error):
            print(String(describing: error))
          }
        }
        .store(in: cancelBag)
    }
  }

  func soldItem(ingameid: Int) {
    print(ingameid)
  }
}

struct StubInventoryInteractor: InventoryInteractor {
  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>) {}
  func collectLootedItems(from monster: Monster) {}
  func soldItem(ingameid: Int) {}
}

extension RealInventoryInteractor {
  func dropCalculating(by monster: Monster) -> [Int] {

    var collectedItemsIds: [Int] = []

    let diceResult: Double = Double.random(in: 0...100)

    if Double(monster.drop1per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop1id)
    }

    if Double(monster.drop2per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop2id)
    }

    if Double(monster.drop3per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop3id)
    }

    if Double(monster.drop4per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop4id)
    }

    if Double(monster.drop5per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop5id)
    }

    if Double(monster.drop6per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop6id)
    }

    if Double(monster.drop7per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop7id)
    }

    if Double(monster.drop8per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop8id)
    }

    if Double(monster.drop9per / 100) >= diceResult {
      collectedItemsIds.append(monster.drop9id)
    }

    if Double(monster.dropCardPer / 100) >= diceResult {
      collectedItemsIds.append(monster.dropCardId)
    }

    return collectedItemsIds
  }
}
