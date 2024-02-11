// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PackageData",
            targets: ["PackageData"]
        ),
        .library(
            name: "PackageDomain",
            targets: ["PackageDomain"]
        ),
        .library(
            name: "PackagePresentation",
            targets: ["PackagePresentation"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Swinject/Swinject.git",
            from: "2.8.4"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PackageData",
            dependencies: ["Swinject", "PackageDomain"]
        ),
        .testTarget(
            name: "PackageDataTests",
            dependencies: ["PackageData"]
        ),
        .target(
            name: "PackageDomain",
            dependencies: []
        ),
        .testTarget(
            name: "PackageDomainTests",
            dependencies: ["PackageDomain"]
        ),
        .target(
            name: "PackagePresentation",
            dependencies: ["PackageDomain"]
        ),
        .testTarget(
            name: "PackagePresentationTests",
            dependencies: ["PackagePresentation"]
        )
    ]
)
