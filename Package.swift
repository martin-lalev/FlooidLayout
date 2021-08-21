// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FlooidLayout",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FlooidLayout",
            targets: ["FlooidLayout"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FlooidLayout",
            path: "FlooidLayout/Source"
        ),
    ]
)
