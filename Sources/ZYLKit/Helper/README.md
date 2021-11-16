# Keychain
## 使用 Keychain sharing
```swift
Keychain.shared.keychainAccessGroupName = "Group.Name"
```

## 寫入 Keychain 
```swift
_ = Keychain.save(str: "content", forKey: "key")
```

## 讀取 Keychain 
```swift
Keychain.load(key: "key")
```

## 刪除 Keychain
```swift
Keychain.delete(key: "key")
```

## 刪除所有 Keychain
```swift
_ = Keychain.clear()
```