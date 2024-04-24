// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Auth",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Auth",
            targets: ["Auth"]),
    ],
    dependencies: [
        .package(path: "../../Core/CommonUI"),
        .package(path: "../../Core/AppGroup"),
        .package(path: "../../Shared/API/UserModuleAPI"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2)),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: .init(10, 24, 0))
    ],
    targets: [
        .target(
            name: "Auth",
            dependencies: [
                .product(name: "AppGroup", package: "AppGroup"),
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "UserModuleAPI", package: "UserModuleAPI"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "AuthTests",
            dependencies: ["Auth"]),
    ]
)
