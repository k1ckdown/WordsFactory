// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DictionaryData",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DictionaryData",
            targets: ["DictionaryData"]),
    ],
    dependencies: [
        .package(path: "../../Domain/DictionaryDomain"),
        .package(path: "../../Shared/Core/AppGroup"),
        .package(path: "../../Shared/Core/API/NetworkingAPI"),
    ],
    targets: [
        .target(
            name: "DictionaryData",
            dependencies: [
                .product(name: "DictionaryDomain", package: "DictionaryDomain"),
                .product(name: "AppGroup", package: "AppGroup"),
                .product(name: "NetworkingAPI", package: "NetworkingAPI")
            ]
        ),
        .testTarget(
            name: "DictionaryDataTests",
            dependencies: ["DictionaryData"]
        ),
    ]
)
