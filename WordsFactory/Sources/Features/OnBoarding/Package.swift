// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnBoarding",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "OnBoarding",
            targets: ["OnBoarding"]),
    ],
    dependencies: [
        .package(name: "CommonUI", path: "../CommonUI"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "OnBoarding",
            dependencies: [
                .product(name: "CommonUI", package: "CommonUI")
            ],
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "OnBoardingTests",
            dependencies: ["OnBoarding"]),
    ]
)
