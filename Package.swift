// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DFramework",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DFramework",
            targets: ["DFramework"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "DFramework",
            dependencies: []),
        .testTarget(
            name: "DFrameworkTests",
            dependencies: ["DFramework"]),
    ],
    swiftLanguageVersions: [.v5]
)
