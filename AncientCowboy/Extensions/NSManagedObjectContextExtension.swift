import Combine
import CoreData

extension NSManagedObjectContext {
  
  func configureAsReadOnlyContext() {
    automaticallyMergesChangesFromParent  = true
    mergePolicy                           = NSRollbackMergePolicy
    undoManager                           = nil
    shouldDeleteInaccessibleFaults        = false
  }

  func configureAsUpdateContext() {
    mergePolicy = NSOverwriteMergePolicy
    undoManager = nil
  }
}
