// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthDomain",
    products: [
        .library(
            name: "AuthDomain",
            targets: ["AuthDomain"]),
    ],
    targets: [
        .target(
            name: "AuthDomain"
        ),
        .testTarget(
            name: "AuthDomainTests",
            dependencies: ["AuthDomain"]
        ),
    ]
)
