// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "CommonUI",
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]),
    ]
)
