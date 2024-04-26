// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Profile",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Profile",
            targets: ["Profile"]
        ),
    ],
    dependencies: [
        .package(path: "../API/ProfileAPI"),
        .package(path: "../../Shared/Core/CommonUI"),
        .package(path: "../../Shared/Domain/AuthDomain"),
        .package(path: "../../Shared/Domain/UserDomain"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: .init(6, 6, 2))
    ],
    targets: [
        .target(
            name: "Profile",
            dependencies: [
                .product(name: "ProfileAPI", package: "ProfileAPI"),
                .product(name: "CommonUI", package: "CommonUI"),
                .product(name: "AuthDomain", package: "AuthDomain"),
                .product(name: "UserDomain", package: "UserDomain")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
        .testTarget(
            name: "ProfileTests",
            dependencies: ["Profile"]
        ),
    ]
)
