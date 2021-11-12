//
//  UserDefault.swift
//  NativeDubai
//
//  Created by Eric on 2021/1/12.
//  Copyright © 2021 Doraemon. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper struct UserDefaultEncoded<T: Codable> {
    let key: String
    let defaultValue: T

    init(key: String, default: T) {
        self.key = key
        defaultValue = `default`
    }

    var wrappedValue: T {
        get {
            guard let jsonString = UserDefaults.standard.string(forKey: key) else {
                return defaultValue
            }
            guard let jsonData = jsonString.data(using: .utf8) else {
                return defaultValue
            }
            guard let value = try? JSONDecoder().decode(T.self, from: jsonData) else {
                return defaultValue
            }
            return value
        }
        set {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            guard let jsonData = try? encoder.encode(newValue) else { return }
            let jsonString = String(bytes: jsonData, encoding: .utf8)
            UserDefaults.standard.set(jsonString, forKey: key)
        }
    }
}

