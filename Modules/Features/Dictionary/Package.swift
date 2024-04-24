// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dictionary",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Dictionary",
            targets: ["Dictionary"]),
    ],
    dependencies: [
        .package(path: "../API/DictionaryAPI"),
        .package(path: "../../Shared/API/WordModuleAPI"),
        .package(path: "../../Core/CommonUI"),
        .package(path: "../../Core/AppGroup"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "Dictionary",
            dependencies: [
                .product(name: "DictionaryAPI", package: "DictionaryAPI"),
                .product(name: "WordModuleAPI", package: "WordModuleAPI"),
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "AppGroup", package: "AppGroup")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "DictionaryTests",
            dependencies: ["Dictionary"]),
    ]
)