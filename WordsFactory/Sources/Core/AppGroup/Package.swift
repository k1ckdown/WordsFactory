// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppGroup",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppGroup",
            targets: ["AppGroup"]
        ),
    ],
    targets: [
        .target(
            name: "AppGroup"
        )
    ]
)
