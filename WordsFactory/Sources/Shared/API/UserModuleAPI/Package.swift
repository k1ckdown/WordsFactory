// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserModuleAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UserModuleAPI",
            targets: ["UserModuleAPI"]),
    ],
    targets: [
        .target(
            name: "UserModuleAPI"),
        .testTarget(
            name: "UserModuleAPITests",
            dependencies: ["UserModuleAPI"]),
    ]
)
