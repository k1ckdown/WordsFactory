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
        .package(path: "../../Core/CommonUI"),
        .package(path: "../../Core/API/NetworkingAPI"),
        .package(url: "https://github.com/dkk/WrappingHStack.git", from: .init(2, 2, 11)),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "Dictionary",
            dependencies: [
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "NetworkingAPI", package: "NetworkingAPI"),
                .product(name: "WrappingHStack", package: "WrappingHStack")
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
