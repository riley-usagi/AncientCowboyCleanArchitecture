import Foundation

extension LazyList {
  
  class Cache {
    
    private var elements = [Int: T]()
    
    func sync(_ access: (inout [Int: T]) throws -> T) throws -> T {
      
      guard Thread.isMainThread else {
        
        var result: T!
        
        try DispatchQueue.main.sync {
          result = try access(&elements)
        }
        
        
        return result
      }
      
      return try access(&elements)
    }
  }
}
