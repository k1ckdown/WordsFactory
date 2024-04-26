// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainTabBar",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MainTabBar",
            targets: ["MainTabBar"]),
    ],
    dependencies: [
        .package(path: "../API/VideoAPI"),
        .package(path: "../API/ProfileAPI"),
        .package(path: "../API/TrainingAPI"),
        .package(path: "../API/DictionarySearchAPI"),
        .package(path: "../../Shared/Core/CommonUI"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "MainTabBar",
            dependencies: [
                .product(name: "VideoAPI", package: "VideoAPI"),
                .product(name: "ProfileAPI", package: "ProfileAPI"),
                .product(name: "TrainingAPI", package: "TrainingAPI"),
                .product(name: "DictionarySearchAPI", package: "DictionarySearchAPI"),
                .product(name: "CommonUI", package: "CommonUI")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "MainTabBarTests",
            dependencies: ["MainTabBar"]),
    ]
)
