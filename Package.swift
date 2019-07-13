// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "FlooidLayout",
    platforms: [.iOS(.v11)],
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
            path: "FlooidLayout"),
    ]
)
