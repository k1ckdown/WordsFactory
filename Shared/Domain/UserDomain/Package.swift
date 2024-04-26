// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDomain",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UserDomain",
            targets: ["UserDomain"]
        ),
    ],
    targets: [
        .target(
            name: "UserDomain"
        ),
        .testTarget(
            name: "UserDomainTests",
            dependencies: ["UserDomain"]
        ),
    ]
)
