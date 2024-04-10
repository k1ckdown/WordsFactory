// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Training",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Training",
            targets: ["Training"]),
    ],
    dependencies: [
        .package(path: "../API/TrainingAPI"),
        .package(path: "../../Shared/API/WordModuleAPI"),
        .package(path: "../../Core/CommonUI"),
        .package(path: "../../Core/Notifications"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "Training",
            dependencies: [
                .product(name: "TrainingAPI", package: "TrainingAPI"),
                .product(name: "WordModuleAPI", package: "WordModuleAPI"),
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "Notifications", package: "Notifications")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "TrainingTests",
            dependencies: ["Training"]),
    ]
)
