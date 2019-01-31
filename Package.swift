// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ParkKit",
    products: [
        .library(
            name: "ParkKit",
            targets: ["ParkKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ParkKit",
            dependencies: []),
        .testTarget(
            name: "ParkKitTests",
            dependencies: ["ParkKit"]),
    ]
)
