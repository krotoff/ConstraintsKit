// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ConstraintsKit",
    products: [
        .library(
            name: "ConstraintsKit",
            targets: ["ConstraintsKit"]),
    ],
    targets: [
        .target(
            name: "ConstraintsKit",
            dependencies: []),
        .testTarget(
            name: "ConstraintsKitTests",
            dependencies: ["ConstraintsKit"]),
    ]
)
