// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WordModule",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WordModule",
            targets: ["WordModule"]),
    ],
    dependencies: [
        .package(path: "../API/WordModuleAPI"),
        .package(path: "../../Core/API/NetworkingAPI"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
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
