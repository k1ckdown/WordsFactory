// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DictionaryAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DictionaryAPI",
            targets: ["DictionaryAPI"]
        ),
    ],
    targets: [
        .target(
            name: "DictionaryAPI"
        ),
        .testTarget(
            name: "DictionaryAPITests",
            dependencies: ["DictionaryAPI"]
        ),
    ]
)
