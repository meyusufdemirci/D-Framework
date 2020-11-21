//
//  DKeychainManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

public class DKeychainManager {

    // MARK: Properties

    public static let shared = DKeychainManager()

    open subscript(key: String) -> String? {
        get {
            get(key: key)
        } set {
            DispatchQueue.global().sync(flags: .barrier) {
                self.set(key: key, value: newValue)
            }
        }
    }
}

// MARK: - Privates

private extension DKeychainManager {

    func set(key: String, value: String?) {
        let query = keychainQuery(key: key)
        let objectData: Data? = value?.data(using: String.Encoding.utf8, allowLossyConversion: false)

        if SecItemCopyMatching(query, nil) == noErr {
            if let dictData = objectData {
                SecItemUpdate(query, NSDictionary(dictionary: [kSecValueData: dictData]))
                return
            }

            SecItemDelete(query)

            return
        }

        if let dictData = objectData {
            query.setValue(dictData, forKey: kSecValueData as String)
            SecItemAdd(query, nil)
        }
    }

    func get(key: String) -> String? {
        let query = keychainQuery(key: key)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnData as String)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnAttributes as String)

        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)

        guard
            let resultsDict = result as? NSDictionary,
            let resultsData = resultsDict.value(forKey: kSecValueData as String) as? Data,
            status == noErr
            else { return nil }
        return String(data: resultsData, encoding: String.Encoding.utf8)
    }

    func keychainQuery(key: String) -> NSMutableDictionary {
        let result = NSMutableDictionary()
        result.setValue(kSecClassGenericPassword, forKey: kSecClass as String)
        result.setValue(key, forKey: kSecAttrService as String)
        result.setValue(kSecAttrAccessibleAfterFirstUnlock, forKey: kSecAttrAccessible as String)
        return result
    }
}
