// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WordModule",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "WordModule",
            targets: ["WordModule"]),
    ],
    dependencies: [
        .package(path: "../API/WordModuleAPI"),
        .package(path: "../../Core/API/NetworkingAPI"),
    ],
    targets: [
        .target(
            name: "WordModule",
            dependencies: [
                .product(name: "WordModuleAPI", package: "WordModuleAPI"),
                .product(name: "NetworkingAPI", package: "NetworkingAPI")
            ]
        ),
        .testTarget(
            name: "WordModuleTests",
            dependencies: ["WordModule"]),
    ]
)
