struct Hero: Equatable {
  var name: String
  var hp: Int = 111
  
  var str: Int = 1
  var agi: Int = 1
  var vit: Int = 1
  var int: Int = 1
  var dex: Int = 1
  var luk: Int = 1
  
  var zeny: Int = 0
  
  init(
    name: String,
    str: Int, agi: Int, vit: Int, int: Int, dex: Int, luk: Int
  ) {
    self.name = name
  }
}
