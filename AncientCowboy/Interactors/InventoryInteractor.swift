import Combine
import SwiftUI

/// Интерактор для работы с Инвентарём героя
protocol InventoryInteractor {
  
  /// Процесс сбора выпавших с Монстра предметов и сохранение их в Инвентарь
  /// - Parameter monster: Объект убитого Монстра
  func collectLootedItems(from monster: Monster)
  
  
  /// Процесс загрузки списка предметов из Инвентаря
  /// - Parameter items: Список предметов Инвентаря
  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>)
  
  
  /// Процесс продажи предметов
  /// - Parameter ingameid: Внутренний id предмета
  func soldItem(ingameid: Int)
}

/// Интерактор для работы с Инвентарём героя
struct RealInventoryInteractor: InventoryInteractor {
  
  /// Сервис для работы с Инвентарём из локальной базы данных
  let inventoryDBService: InventoryDBService
  
  /// Сервис для работы с игровыми Предметами из локальной базы данных
  let itemsDBService: ItemsDBService

  /// Мешок для подписок
  let cancelBag = CancelBag()

  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>) {
    

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
    
    /// Мешок для подписок
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


extension RealInventoryInteractor {
  
  /// Расчёт доропа вещей с текущего Монстра
  /// - Parameter monster: Выбранный Монстр
  /// - Returns: Список игровых Предметов, которые упали с выбранного Монстра
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


// MARK: - Stub
struct StubInventoryInteractor: InventoryInteractor {
  func loadInventoryItems(items: LoadableSubject<LazyList<InventoryItem>>) {}
  func collectLootedItems(from monster: Monster) {}
  func soldItem(ingameid: Int) {}
}
