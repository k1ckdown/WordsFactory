// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserData",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UserData",
            targets: ["UserData"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain/UserDomain"),
        .package(path: "../../Core/AppGroup"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: .init(10, 24, 0))
    ],
    targets: [
        .target(
            name: "UserData",
            dependencies: [
                .product(name: "UserDomain", package: "UserDomain"),
                .product(name: "AppGroup", package: "AppGroup"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "UserDataTests",
            dependencies: ["UserData"]
        ),
    ]
)
