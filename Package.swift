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
        .package(
            name: "SnapKit",
            url: "https://github.com/SnapKit/SnapKit.git",
            from: "5.0.1"
        )
    ],
    targets: [
        .target(
            name: "DFramework",
            dependencies: [
                "SnapKit"
            ]),
        .testTarget(
            name: "DFrameworkTests",
            dependencies: ["DFramework"]),
    ],
    swiftLanguageVersions: [.v5]
)
