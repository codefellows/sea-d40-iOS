import UIKit
import Security

// Identifiers
let userAccount = "github"
let accessGroup = "MySerivice"

// Arguments for the keychain queries
let kSecClassValue = kSecClass as NSString
let kSecAttrAccountValue = kSecAttrAccount as NSString
let kSecValueDataValue = kSecValueData as NSString
let kSecClassGenericPasswordValue = kSecClassInternetPassword as NSString
let kSecAttrServiceValue = kSecAttrService as NSString
let kSecMatchLimitValue = kSecMatchLimit as NSString
let kSecReturnDataValue = kSecReturnData as NSString
let kSecMatchLimitOneValue = kSecMatchLimitOne as NSString

class KeychainService: NSObject {
  
  /**
  * Exposed methods to perform queries.
  * Note: feel free to play around with the arguments
  * for these if you want to be able to customise the
  * service identifier, user accounts, access groups, etc.
  */
 class func saveToken(token: NSString) {
    self.save(token)
  }
  
  class func loadToken() -> NSString? {
    var token = self.loadFromKeychain()
    
    return token
  }
  
  /**
  * Internal methods for querying the keychain.
  */
  private class func save(data: NSString) {
    var dataFromString: NSData = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    
    var keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, userAccount, dataFromString], forKeys: [kSecClassValue, kSecAttrAccountValue, kSecValueDataValue])
    
    // Delete any existing items
    SecItemDelete(keychainQuery)
    
    // Add the new keychain item
    var status: OSStatus = SecItemAdd(keychainQuery, nil)
  }
  
  private class func loadFromKeychain() -> NSString? {
    // Instantiate a new default keychain query
    // Tell the query to return a result
    // Limit our results to one item
    
    var keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, userAccount, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
    
    var dataTypeRef :Unmanaged<AnyObject>?
    
    // Search for the keychain items
    let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
    
    var contentsOfKeychain: NSString?
    
    if let retainedData = dataTypeRef?.takeRetainedValue() as? NSData {
      contentsOfKeychain = NSString(data: retainedData, encoding: NSUTF8StringEncoding)
    } else {
      println("Nothing was retrieved from the keychain. Status code \(status)")
    }
    dataTypeRef?.release()
    return contentsOfKeychain
  }
}