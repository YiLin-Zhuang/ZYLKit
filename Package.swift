// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZYLKit", // YourPackageName
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ZYLKit", // YourPackageName
            targets: ["ZYLKit"]), // YourPackageName
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ZYLKit", // YourPackageName
            dependencies: []),
        .testTarget(
            name: "ZYLKitTests", // YourPackageNameTests
            dependencies: ["ZYLKit"]), // YourPackageName
    ],
    swiftLanguageVersions: [.v5]
)
