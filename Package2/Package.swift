// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package2",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Package2Data",
            targets: ["Package2Data"]
        ),
        .library(
            name: "Package2Domain",
            targets: ["Package2Domain"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Package2Data",
            dependencies: ["Package2Domain"]
        ),
        .testTarget(
            name: "Package2DataTests",
            dependencies: ["Package2Data"]
        ),
        .target(
            name: "Package2Domain",
            dependencies: []
        ),
        .testTarget(
            name: "Package2DomainTests",
            dependencies: ["Package2Domain"]
        )
    ]
)
