import SwiftUI

extension ProcessInfo {
  var isRunningTests: Bool {
    environment["XCTestConfigurationFilePath"] != nil
  }
}
