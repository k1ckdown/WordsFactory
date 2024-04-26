// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DictionarySearch",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DictionarySearch",
            targets: ["DictionarySearch"]
        ),
    ],
    dependencies: [
        .package(path: "../API/DictionarySearchAPI"),
        .package(path: "../../Shared/Domain/DictionaryDomain"),
        .package(path: "../../Shared/Core/CommonUI"),
        .package(path: "../../Shared/Core/AppGroup"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "DictionarySearch",
            dependencies: [
                .product(name: "DictionarySearchAPI", package: "DictionarySearchAPI"),
                .product(name: "DictionaryDomain", package: "DictionaryDomain"),
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "AppGroup", package: "AppGroup")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "DictionarySearchTests",
            dependencies: ["DictionarySearch"]
        ),
    ]
)
