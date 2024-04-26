// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DictionaryDomain",
    products: [
        .library(
            name: "DictionaryDomain",
            targets: ["DictionaryDomain"]
        ),
    ],
    targets: [
        .target(
            name: "DictionaryDomain"
        ),
        .testTarget(
            name: "DictionaryDomainTests",
            dependencies: ["DictionaryDomain"]
        ),
    ]
)
