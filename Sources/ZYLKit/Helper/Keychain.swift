//
//  Keychain.swift
//  goldwayController
//
//  Created by yi-Lin on 2021/11/16.
//

import Foundation
import Security

public class Keychain {
    private static let shared = Keychain()
    
    private init() {}
    
    private var keychainAccessGroupName = ""
    
    public class func save(str: String?, forKey: String) -> Bool {
        if str == nil {
            return false
        }

        let dataFromString: Data = str!.data(using: .utf8)!
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: forKey,
            kSecAttrAccessGroup as String : Keychain.shared.keychainAccessGroupName,
            kSecValueData as String: dataFromString
        ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        let status: OSStatus = SecItemAdd(query as CFDictionary, nil)

        return status == noErr
    }

    public class func load(key: String) -> String? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrAccessGroup as String : Keychain.shared.keychainAccessGroupName,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne
        ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr,let dataTypeRef = dataTypeRef as? Data {
            return String(data: dataTypeRef , encoding: .utf8)
        }
        return nil
    }

    public class func delete(key: String) -> Bool {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccessGroup as String : Keychain.shared.keychainAccessGroupName,
            kSecAttrAccount as String: key
        ] as [String : Any]

        let status: OSStatus = SecItemDelete(query as CFDictionary)

        return status == noErr
    }

    public class func clear() -> Bool {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccessGroup as String : Keychain.shared.keychainAccessGroupName,
        ] as [String : Any]

        let status: OSStatus = SecItemDelete(query as CFDictionary)

        return status == noErr
    }
    
    public class func setGroupName(_ name: String) {
        Keychain.shared.keychainAccessGroupName = name
    }
}
