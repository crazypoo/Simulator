import Cocoa

struct File {

  static func directories(path: NSURL) -> [String] {
    let results = try? NSFileManager.defaultManager()
      .contentsOfDirectoryAtPath(path.path!)
      .filter {
        return isDirectory(path.URLByAppendingPathComponent("\($0)").path!, name: $0)
      }

    return results ?? []
  }

  static func isDirectory(path: String, name: String) -> Bool {
    var flag: ObjCBool =  false
    NSFileManager.defaultManager().fileExistsAtPath(path, isDirectory: &flag)

    return Bool(flag) && !name.hasPrefix(".")
  }
}
