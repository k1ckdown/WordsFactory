// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DictionarySearchAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DictionarySearchAPI",
            targets: ["DictionarySearchAPI"]),
    ],
    targets: [
        .target(
            name: "DictionarySearchAPI"),
        .testTarget(
            name: "DictionarySearchAPITests",
            dependencies: ["DictionarySearchAPI"]
        ),
    ]
)
