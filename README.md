# ZYLKit
[![Version](https://img.shields.io/cocoapods/v/ZYLKit.svg?style=flat)](https://cocoapods.org/pods/ZYLKit)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://cocoapods.org/pods/ZYLKit)
[![License](https://img.shields.io/cocoapods/l/ZYLKit.svg?style=flat)](https://cocoapods.org/pods/ZYLKit)
[![Platform](https://img.shields.io/cocoapods/p/ZYLKit.svg?style=flat)](https://cocoapods.org/pods/ZYLKit)

## Example
[Keychain](#keychain) 


## Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/YiLin-Zhuang/ZYLKit.git")
]
```

## CocoaPods
### Requirements

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Installation

ZYLKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZYLKit'
```

## Author

info@yilin.tw, https://yilin.tw

## License

ZYLKit is available under the MIT license. See the LICENSE file for more info.

---

# Keychain
## 使用 Keychain sharing
```swift
Keychain.setGroupName("Group.Name")
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
