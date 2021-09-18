// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Muscat",
    products: [
        .executable(
            name: "muscat",
            targets: ["muscat"]
        ),
        .library(
            name: "MuscatKit",
            targets: ["MuscatKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/trickart/MeCab.git",
            .upToNextMinor(from: "0.0.2")
        ),
        .package(
            url: "https://github.com/trickart/MeCabIPAdic.git",
            .upToNextMinor(from: "270.20070801.2")
        ),
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            .upToNextMajor(from: "0.4.4")
        ),
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "MuscatKit",
            dependencies: [
                "MeCab",
                "MeCabIPAdic"
            ]
        ),
        .target(
            name: "muscat",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "OrderedCollections", package: "swift-collections"),
                "MuscatKit"
            ]
        ),
        .testTarget(
            name: "MuscatTests",
            dependencies: ["muscat"]
        ),
        .testTarget(
            name: "MuscatKitTests",
            dependencies: ["MuscatKit"]
        )
    ]
)
