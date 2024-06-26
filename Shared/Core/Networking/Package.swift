// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
    ],
    dependencies: [
        .package(path: "../API/NetworkingAPI")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "NetworkingAPI", package: "NetworkingAPI")
            ]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]),
    ]
)
