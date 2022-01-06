//
//  UserDefault.swift
//  NativeDubai
//
//  Created by Eric on 2021/1/12.
//  Copyright © 2021 Doraemon. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<T: Codable> {
    public let key: String
    public let defaultValue: T

    public init(_ userDefaultsKey: String, default: T) {
        self.key = userDefaultsKey
        defaultValue = `default`
    }

    public var wrappedValue: T {
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

