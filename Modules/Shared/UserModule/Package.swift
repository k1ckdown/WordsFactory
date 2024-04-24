// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserModule",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UserModule",
            targets: ["UserModule"]),
    ],
    dependencies: [
        .package(path: "../API/UserModuleAPI"),
        .package(path: "../../Core/AppGroup"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: .init(10, 24, 0))
    ],
    targets: [
        .target(
            name: "UserModule",
            dependencies: [
                .product(name: "AppGroup", package: "AppGroup"),
                .product(name: "UserModuleAPI", package: "UserModuleAPI"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "UserModuleTests",
            dependencies: ["UserModule"]),
    ]
)
