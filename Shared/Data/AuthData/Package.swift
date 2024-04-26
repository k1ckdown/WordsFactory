// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthData",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AuthData",
            targets: ["AuthData"]
        ),
    ],
    dependencies: [
        .package(path: "../../Domain/AuthDomain"),
        .package(path: "../../Core/AppGroup"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: .init(10, 24, 0))
    ],
    targets: [
        .target(
            name: "AuthData",
            dependencies: [
                .product(name: "AuthDomain", package: "AuthDomain"),
                .product(name: "AppGroup", package: "AppGroup"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "AuthDataTests",
            dependencies: ["AuthData"]
        ),
    ]
)
